resource "azurerm_storage_account" "static_website_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind             = "StorageV2"

  tags = var.tags
}

resource "azurerm_storage_account_static_website" "static_website" {
  storage_account_id = azurerm_storage_account.static_website_account.id
  index_document     = var.index_document
  error_404_document = var.error_404_document
}

# Wait for 2 minutes after enabling static website
resource "time_sleep" "wait_for_3m_after_static_website_enabled" {
  depends_on      = [azurerm_storage_account_static_website.static_website]
  create_duration = "3m"
}

# Load all .html files from the html/ directory
locals {
  html_files = fileset("${path.module}/html", "*.html")
}

resource "azurerm_storage_blob" "html_files" {
  for_each               = { for file in local.html_files : file => file }
  name                   = each.key
  storage_account_name   = azurerm_storage_account.static_website_account.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/html/${each.key}"
  content_type           = "text/html"
}