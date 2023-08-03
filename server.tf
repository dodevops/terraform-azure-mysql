resource "azurerm_mysql_flexible_server" "server" {
  name                   = "${var.project}${var.stage}dbsrv${var.suffix}"
  location               = var.location
  resource_group_name    = var.resource_group
  administrator_login    = var.admin_login
  administrator_password = var.admin_password
  sku_name               = var.database_host_sku
  storage {
    size_gb           = var.database_storage_size
    auto_grow_enabled = var.database_storage_autogrow
    iops              = var.database_storage_iops
  }
  version               = var.database_version
  backup_retention_days = var.backup_retention_days

  delegated_subnet_id = var.delegated_subnet_id
  private_dns_zone_id = var.private_dns_zone_id

  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  zone = var.availability_zone

  lifecycle {
    precondition {
      condition     = (var.private_dns_zone_id == null && var.delegated_subnet_id == null) || (var.private_dns_zone_id != null && var.delegated_subnet_id != null)
      error_message = "The parameter private_dns_zone_id requires the parameter delegated_subnet_id and vice versa."
    }
  }
}
