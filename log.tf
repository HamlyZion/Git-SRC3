resource "azurerm_log_analytics_workspace" "trtf-analytics" {
  name                = "acctest-01"
  location            = azurerm_resource_group.trtf.name
  resource_group_name = azurerm_resource_group.trtf.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}