resource "azurerm_mysql_flexible_server_firewall_rule" "firewall" {
  for_each            = var.allowed_ips
  start_ip_address    = each.value.start
  end_ip_address      = each.value.end
  name                = "${var.project}${var.stage}dbfw${each.key}"
  resource_group_name = var.resource_group
  server_name         = azurerm_mysql_flexible_server.server.name
}
