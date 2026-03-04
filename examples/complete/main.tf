# Configure the Alibaba Cloud Provider
provider "alicloud" {
  region = var.region
}

# Random ID for unique naming
resource "random_id" "suffix" {
  byte_length = 4
}

# Local variables
locals {
  name_prefix = "polardb-mysql-mcp-${random_id.suffix.hex}"
}

# Data source to get available zones
data "alicloud_polardb_node_classes" "default" {
  db_type    = "MySQL"
  db_version = "8.0"
  pay_type   = "PostPaid"
  category   = "SENormal"
}

# Call the PolarDB MySQL MCP module
module "polardb_mysql_mcp" {
  source = "../../"

  vpc_config = {
    cidr_block = var.vpc_cidr_block
    vpc_name   = "${local.name_prefix}-vpc"
  }

  vswitch_config = {
    cidr_block   = var.vswitch_cidr_block
    zone_id      = var.availability_zone != null ? var.availability_zone : data.alicloud_polardb_node_classes.default.classes[0].zone_id
    vswitch_name = "${local.name_prefix}-vswitch"
  }

  polardb_config = {
    db_type           = "MySQL"
    db_version        = "8.0"
    creation_category = "SENormal"
    storage_space     = var.storage_space
    db_node_class     = var.db_node_class
    pay_type          = "PostPaid"
    storage_type      = "ESSDAUTOPL"
    security_ips      = var.security_ips
    description       = "${local.name_prefix}-cluster"
  }

  account_config = {
    account_name = var.account_name
    account_type = "Super"
  }

  account_password = var.db_password

  database_config = {
    db_name            = var.database_name
    character_set_name = "utf8"
  }
}

# Data source to get PolarDB endpoints after cluster creation
data "alicloud_polardb_endpoints" "polardb_endpoints" {
  db_cluster_id = module.polardb_mysql_mcp.polardb_cluster_id
  depends_on    = [module.polardb_mysql_mcp]
}

# Create public endpoint for PolarDB cluster
resource "alicloud_polardb_endpoint_address" "public_endpoint" {
  db_endpoint_id = data.alicloud_polardb_endpoints.polardb_endpoints.endpoints[0].db_endpoint_id
  db_cluster_id  = module.polardb_mysql_mcp.polardb_cluster_id
  net_type       = "Public"
}
