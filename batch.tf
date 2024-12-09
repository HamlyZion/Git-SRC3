/*Déploiement ressourcegroup + storage account batch*/

/*Penser à ajouter les autres fichiers*/

resource "azurerm_resource_group" "rg_batch" {
  count = 3
  name     = "theoruf$(count)"
  location = "West Europe"
}

resource "azurerm_storage_account" "sa_batch" {
  name                     = "theoruf-sa-batch"
  resource_group_name      = azurerm_resource_group.rg_batch{0}.name
  location                 = azurerm_resource_group.rg_batch{0}.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  access_tier              = "Cool"
}