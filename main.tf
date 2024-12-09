#terraform init : initialise les ressources, check tous les fichiers tf de l'arborescence descendante pour dl les providers ect... 
#terraform apply : fait un plan et applique
#terraform plan

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
    features {
    }
}

data "azurerm_client_config" "trtf_cc" {}

resource "azurerm_resource_group" "trtf" {
  name     = "theoruf"
  location = "West Europe"
}

resource "azurerm_key_vault" "trtf_kv" {
  name                = "theoruf-kv"
  location            = azurerm_resource_group.trtf.location
  resource_group_name = azurerm_resource_group.trtf.name
  tenant_id           = data.azurerm_client_config.trtf_cc.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.trtf_cc.tenant_id
    object_id = data.azurerm_client_config.trtf_cc.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "List",
      "Purge",
      "Delete"
    ]

    storage_permissions = [
      "Get",
      "List",
      "Set",
      "SetSAS",
      "GetSAS",
      "DeleteSAS",
      "Update",
      "RegenerateKey"
    ]
  }
}

resource "azurerm_key_vault_secret" "trtf_kvs" {
  name         = "Le-mot-de-passe-du-kidisecret"
  value        = random_password.trtf_pwd.result
  key_vault_id = azurerm_key_vault.trtf_kv.id
}

resource "random_password" "trtf_pwd" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
/*
resource "azurerm_resource_group" "trtf-rg-map" {
  for_each = var.location_map
  name     = each.value.name
  location = each.value.location
}
*/

