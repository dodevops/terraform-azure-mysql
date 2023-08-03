variable "location" {
  type        = string
  description = "The azure location used for azure"
}

variable "project" {
  type        = string
  description = "Three letter project key"
}

variable "stage" {
  type        = string
  description = "Stage for this ressource group"
}

variable "resource_group" {
  type        = string
  description = "Azure Resource Group to use"
}

variable "database_suffixes" {
  type        = list(string)
  description = "List of suffixes for databases to be created"
}

variable "database_version" {
  type        = string
  description = "Database version to use"
  default     = "8.0.21"
}

variable "suffix" {
  type        = string
  description = "Naming suffix to allow multiple instances of this module"
  default     = ""
}

variable "charset" {
  type        = string
  description = "Charset for the databases, which needs to be a valid MySQL charset"
}

variable "collation" {
  type        = string
  description = "Charset for the databases, which needs to be a valid MySQL charset"
}

variable "backup_retention_days" {
  type        = number
  description = "Number of days to keep backups"
  default     = 7
  validation {
    condition     = var.backup_retention_days >= 7 && var.backup_retention_days <= 35
    error_message = "Backup retention days has to be between 7 and 35 including."
  }
}

variable "admin_login" {
  type        = string
  description = "Admin login"
  default     = "mysqladmin"
}

variable "admin_password" {
  type        = string
  description = "Admin password"
}

variable "database_host_sku" {
  type        = string
  default     = "GP_Standard_D4ds_v4"
  description = "SKU for the database server to use"
}

variable "database_storage_size" {
  type        = string
  default     = "20"
  description = "Required database storage (in GB)"
}

variable "database_storage_autogrow" {
  type        = bool
  default     = true
  description = "Autogrow storage when limit is reached?"
}

variable "database_storage_iops" {
  type        = number
  default     = 3600
  description = "IO operations per second"
}

variable "allowed_ips" {
  description = <<EOF
    A hash of permissions to access the database server by ip. The hash key is the name suffix and each value
    has a start and an end value.

    * For public access set start to 0.0.0.0 and end to 255.255.255.255
    * To allow access from all Azure services to this database, set start and end to 0.0.0.0
  EOF
  type = map(object({
    start = string,
    end   = string
  }))
  default = {}
}

variable "delegated_subnet_id" {
  description = <<-EOT
    The id of a subnet that the server will be created in if private-only access is required.
    This subnet requires a service delegation definition like this:
    ```hcl
      delegation {
        name = "fs"
        service_delegation {
          name = "Microsoft.DBforMySQL/flexibleServers"
          actions = [
            "Microsoft.Network/virtualNetworks/subnets/join/action",
          ]
        }
      }
    ```
  EOT
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "The id of the private dns zone when using private-only access"
  type        = string
  default     = null
}

variable "geo_redundant_backup_enabled" {
  description = "Whether backups should be geo redundant"
  type        = bool
  default     = false
}

variable "configurations" {
  description = "Additional MySQL configurations"
  type        = map(string)
  default     = {}
}

variable "availability_zone" {
  description = "The availability zone the server will be created in"
  type        = string
  default     = "1"
}
