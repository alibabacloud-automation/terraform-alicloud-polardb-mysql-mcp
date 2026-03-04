# Create VPC
resource "alicloud_vpc" "vpc" {
  cidr_block = var.vpc_config.cidr_block
  vpc_name   = var.vpc_config.vpc_name
}

# Create VSwitch
resource "alicloud_vswitch" "vswitch" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_config.cidr_block
  zone_id      = var.vswitch_config.zone_id
  vswitch_name = var.vswitch_config.vswitch_name
}

# Create PolarDB cluster
resource "alicloud_polardb_cluster" "polardb_cluster" {
  vpc_id            = alicloud_vpc.vpc.id
  db_type           = var.polardb_config.db_type
  zone_id           = alicloud_vswitch.vswitch.zone_id
  vswitch_id        = alicloud_vswitch.vswitch.id
  db_version        = var.polardb_config.db_version
  creation_category = var.polardb_config.creation_category
  storage_space     = var.polardb_config.storage_space
  db_node_class     = var.polardb_config.db_node_class
  pay_type          = var.polardb_config.pay_type
  storage_type      = var.polardb_config.storage_type
  security_ips      = var.polardb_config.security_ips
  description       = var.polardb_config.description
}

# Create PolarDB account
resource "alicloud_polardb_account" "account" {
  db_cluster_id    = alicloud_polardb_cluster.polardb_cluster.id
  account_name     = var.account_config.account_name
  account_password = var.account_password
  account_type     = var.account_config.account_type
}

# Create PolarDB database
resource "alicloud_polardb_database" "polardb_database" {
  db_cluster_id      = alicloud_polardb_cluster.polardb_cluster.id
  db_name            = var.database_config.db_name
  character_set_name = var.database_config.character_set_name
  account_name       = alicloud_polardb_account.account.account_name
}
