# output for storage account
output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.static_website_account.name
}

output "static_website_url" {
  description = "The URL of the static website"
  value       = azurerm_storage_account.static_website_account.primary_web_endpoint
}