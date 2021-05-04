output "server_fqdn" {
  description = "FQDN of the database service"
  value       = azurerm_mysql_server.server.fqdn
}

output "admin_login" {
  value = var.admin_login
}

output "admin_password" {
  value = var.admin_password
}

output "databases" {
  value = length(azurerm_mysql_database.db) > 0 ? {
    for index, suffix in var.database_suffixes : suffix => azurerm_mysql_database.db[suffix].name
  } : {}
}
