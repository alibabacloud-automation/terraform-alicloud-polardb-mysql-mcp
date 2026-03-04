variable "vpc_config" {
  description = "Configuration for VPC. The attribute 'cidr_block' is required."
  type = object({
    cidr_block = string
    vpc_name   = optional(string, "default-vpc")
  })
  default = {
    cidr_block = null
  }
}

variable "vswitch_config" {
  description = "Configuration for VSwitch. The attributes 'cidr_block' and 'zone_id' are required."
  type = object({
    cidr_block   = string
    zone_id      = string
    vswitch_name = optional(string, "default-vswitch")
  })
  default = {
    cidr_block = null
    zone_id    = null
  }
}

variable "polardb_config" {
  description = "Configuration for PolarDB cluster. The attributes 'db_type', 'db_version', 'creation_category', 'storage_space', 'db_node_class', 'pay_type', 'storage_type' are required."
  type = object({
    db_type           = string
    db_version        = string
    creation_category = string
    storage_space     = number
    db_node_class     = string
    pay_type          = string
    storage_type      = string
    security_ips      = optional(list(string), ["127.0.0.1", "0.0.0.0/0"])
    description       = optional(string, "PolarDB MySQL cluster")
  })
  default = {
    db_type           = "MySQL"
    db_version        = "8.0"
    creation_category = "SENormal"
    storage_space     = 40
    db_node_class     = "polar.mysql.g1.tiny.c"
    pay_type          = "PostPaid"
    storage_type      = "ESSDAUTOPL"
  }
}

variable "account_config" {
  description = "Configuration for PolarDB account. The attributes 'account_name' and 'account_type' are required."
  type = object({
    account_name = string
    account_type = optional(string, "Super")
  })
  default = {
    account_name = "polar_admin"
    account_type = "Super"
  }
}

variable "account_password" {
  description = "Password for PolarDB account."
  type        = string
  default     = null
  sensitive   = true
}

variable "database_config" {
  description = "Configuration for PolarDB database. The attributes 'db_name' and 'character_set_name' are required."
  type = object({
    db_name            = string
    character_set_name = optional(string, "utf8")
  })
  default = {
    db_name            = "default_db"
    character_set_name = "utf8"
  }
}
