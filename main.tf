resource "azurerm_mysql_server" "server" {
  name                = "${var.project}${var.stage}dbsrv"
  location            = var.location
  resource_group_name = var.resource_group

  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password

  sku_name   = var.database_host_sku
  storage_mb = var.database_storage
  version    = var.database_version

  auto_grow_enabled                 = true
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = var.public_access
  ssl_enforcement_enabled           = true
}

resource "azurerm_mysql_database" "db" {
  for_each            = toset(var.database_suffixes)
  name                = "${var.project}${var.stage}db${each.value}"
  resource_group_name = var.resource_group
  server_name         = azurerm_mysql_server.server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
