# VPC outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = alicloud_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = alicloud_vpc.vpc.cidr_block
}

# VSwitch outputs
output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = alicloud_vswitch.vswitch.id
}

output "vswitch_zone_id" {
  description = "The zone ID of the VSwitch"
  value       = alicloud_vswitch.vswitch.zone_id
}

# PolarDB cluster outputs
output "polardb_cluster_id" {
  description = "The ID of the PolarDB cluster"
  value       = alicloud_polardb_cluster.polardb_cluster.id
}

output "polardb_cluster_connection_string" {
  description = "The connection string of the PolarDB cluster"
  value       = alicloud_polardb_cluster.polardb_cluster.connection_string
}

output "polardb_cluster_port" {
  description = "The port of the PolarDB cluster"
  value       = alicloud_polardb_cluster.polardb_cluster.port
}

# PolarDB account outputs
output "polardb_account_name" {
  description = "The name of the PolarDB account"
  value       = alicloud_polardb_account.account.account_name
}

# PolarDB database outputs
output "polardb_database_name" {
  description = "The name of the PolarDB database"
  value       = alicloud_polardb_database.polardb_database.db_name
}

output "polardb_database_character_set" {
  description = "The character set of the PolarDB database"
  value       = alicloud_polardb_database.polardb_database.character_set_name
}
