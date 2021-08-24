resource "azurerm_mysql_database" "db" {
  for_each            = toset(var.database_suffixes)
  name                = "${var.project}${var.stage}db${each.value}"
  resource_group_name = var.resource_group
  server_name         = azurerm_mysql_server.server.name
  charset             = var.charset
  collation           = var.collation
}