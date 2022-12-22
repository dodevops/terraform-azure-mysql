resource "azurerm_mysql_flexible_database" "db" {
  for_each            = toset(var.database_suffixes)
  resource_group_name = var.resource_group
  server_name         = azurerm_mysql_flexible_server.server.name
  name                = "${var.project}${var.stage}db${each.value}"
  charset             = var.charset
  collation           = var.collation
}
