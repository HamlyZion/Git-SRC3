/*
resource "azurerm_virtual_network" "trtf_vnet" {
  name                = "vnet-rg-weu-trtf2"
  location            = azurerm_resource_group.trtf-rg-map["rg1"].location
  resource_group_name = azurerm_resource_group.trtf-rg-map["rg1"].name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "trtf_subnets" {
    for_each = var.subnet_count
    name           = each.value.name
    address_prefixes = each.value.address_prefix
    resource_group_name = azurerm_resource_group.trtf-rg-map["rg1"].name
    virtual_network_name = azurerm_virtual_network.trtf_vnet.name
}

resource "azurerm_network_interface" "trtf_net_int" {
  name                = "Vm-int"
  location            = azurerm_resource_group.trtf-rg-map["rg1"].location
  resource_group_name = azurerm_resource_group.trtf-rg-map["rg1"].name

  ip_configuration {
    name                          = "Compta-PC-1"
    subnet_id                     = azurerm_subnet.trtf_subnets["subnet2"].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.trtf_public_ip.id
  }
}

resource "azurerm_public_ip" "trtf_public_ip" {
  name                = "VM-Ubuntu-IP"
  resource_group_name = azurerm_resource_group.trtf-rg-map["rg1"].name
  location            = azurerm_resource_group.trtf-rg-map["rg1"].location
  allocation_method   = "Static"
}
*/