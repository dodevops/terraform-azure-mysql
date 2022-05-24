resource "azurerm_mysql_server" "server" {
  name                          = "${var.project}${var.stage}dbsrv"
  location                      = var.location
  resource_group_name           = var.resource_group
  administrator_login           = var.admin_login
  administrator_login_password  = var.admin_password
  sku_name                      = var.database_host_sku
  storage_mb                    = var.database_storage
  version                       = var.database_version
  backup_retention_days         = var.backup_retention_days
  public_network_access_enabled = var.public_access

  auto_grow_enabled                 = true
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}