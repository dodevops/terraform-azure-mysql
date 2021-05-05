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
  default     = "8.0"
}

variable "suffix" {
  type        = string
  description = "Naming suffix to allow multiple instances of this module"
  default     = ""
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
  type    = string
  default = "GP_Gen5_1"
}

variable "database_storage" {
  type    = string
  default = "5120"
}