# VPC outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.polardb_mysql_mcp.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.polardb_mysql_mcp.vpc_cidr_block
}

# VSwitch outputs
output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = module.polardb_mysql_mcp.vswitch_id
}

# PolarDB cluster outputs
output "polardb_cluster_id" {
  description = "The ID of the PolarDB cluster"
  value       = module.polardb_mysql_mcp.polardb_cluster_id
}

output "polardb_cluster_connection_string" {
  description = "The connection string of the PolarDB cluster"
  value       = module.polardb_mysql_mcp.polardb_cluster_connection_string
}

output "polardb_public_connection_string" {
  description = "The public connection string of the PolarDB cluster"
  value       = alicloud_polardb_endpoint_address.public_endpoint.connection_string
}

output "polardb_public_ip_address" {
  description = "The public IP address of the PolarDB cluster"
  value       = alicloud_polardb_endpoint_address.public_endpoint.ip_address
}

output "polardb_account_name" {
  description = "The name of the PolarDB account"
  value       = module.polardb_mysql_mcp.polardb_account_name
}

output "polardb_database_name" {
  description = "The name of the PolarDB database"
  value       = module.polardb_mysql_mcp.polardb_database_name
}
