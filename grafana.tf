/*
resource "azurerm_dashboard_grafana" "trtf_grafana" {
  name                              = "trtf-grafana"
  resource_group_name               = azurerm_resource_group.trtf-rg-map["rg1"].name
  location                          = azurerm_resource_group.trtf-rg-map["rg1"].location
  api_key_enabled                   = true
  deterministic_outbound_ip_enabled = true
  public_network_access_enabled     = true

  identity {
    type = "SystemAssigned"
  }
}
*/