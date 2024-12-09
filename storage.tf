/* Cours 1 : Non réutilisé après
resource "azurerm_storage_account" "trtfsto" {
  name                     = "theorufsto"
  resource_group_name      = azurerm_resource_group.trtf.name
  location                 = azurerm_resource_group.trtf.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  access_tier              = "Cool"
}

resource "azurerm_storage_container" "trtfsc" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.trtfsto.name
  container_access_type = "private"
}

data "azurerm_storage_account_sas" "example" {
  connection_string = azurerm_storage_account.trtfsto.primary_connection_string
  https_only        = true

  resource_types {
    service   = true
    container = false
    object    = false
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2021-04-30T00:00:00Z"
  expiry = "2023-04-30T00:00:00Z"

  permissions {
    read    = true
    write   = true
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = false
    process = false
    tag     = false
    filter  = false
  }
}

resource "azurerm_key_vault_managed_storage_account" "trtf_kv_msa" {
  name                         = "theorufmstokv"
  key_vault_id                 = azurerm_key_vault.trtf_kv.id
  storage_account_id           = azurerm_storage_account.trtfsto.id
  storage_account_key          = "key1"
  regenerate_key_automatically = false
  regeneration_period          = "P1D"
}

resource "azurerm_key_vault_managed_storage_account_sas_token_definition" "trtf_kv_msa_sas_td" {
  name                       = "theoruftokendef"
  validity_period            = "P1D"
  managed_storage_account_id = azurerm_key_vault_managed_storage_account.trtf_kv_msa.id
  sas_template_uri           = data.azurerm_storage_account_sas.example.sas
  sas_type                   = "account"
}
*/