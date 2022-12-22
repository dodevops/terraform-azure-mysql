resource "azurerm_mysql_flexible_server_configuration" "require-secure-transport" {
  resource_group_name = var.resource_group
  server_name         = azurerm_mysql_flexible_server.server.name
  name                = "require_secure_transport"
  value               = "ON"
}

resource "azurerm_mysql_flexible_server_configuration" "tls-version" {
  resource_group_name = var.resource_group
  server_name         = azurerm_mysql_flexible_server.server.name
  name                = "tls_version"
  value               = "TLSv1.2"
}

resource "azurerm_mysql_flexible_server_configuration" "configuration" {
  for_each            = var.configurations
  resource_group_name = var.resource_group
  server_name         = azurerm_mysql_flexible_server.server.name
  name                = each.key
  value               = each.value
}
