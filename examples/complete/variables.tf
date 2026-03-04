variable "region" {
  description = "The Alibaba Cloud region where resources will be created"
  type        = string
  default     = "cn-hangzhou"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "vswitch_cidr_block" {
  description = "CIDR block for the VSwitch"
  type        = string
  default     = "192.168.0.0/24"
}

variable "availability_zone" {
  description = "Availability zone for resources"
  type        = string
  default     = null
}

variable "storage_space" {
  description = "Storage space for PolarDB cluster in GB"
  type        = number
  default     = 40
}

variable "db_node_class" {
  description = "Instance class for PolarDB cluster"
  type        = string
  default     = "polar.mysql.g1.tiny.c"
}

variable "security_ips" {
  description = "List of IP addresses allowed to access PolarDB"
  type        = list(string)
  default     = ["127.0.0.1", "0.0.0.0/0"]
}

variable "account_name" {
  description = "PolarDB account name"
  type        = string
  default     = "polar_ai"
}

variable "db_password" {
  description = "PolarDB account password"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "PolarDB database name"
  type        = string
  default     = "db-test"
}
