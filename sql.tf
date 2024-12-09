/*
resource "azurerm_mssql_server" "trtf_mysql" {
  name                         = "theoruf-mssqlserver"
  resource_group_name          = azurerm_resource_group.trtf.name
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "admin-theo"
  administrator_login_password = random_password.trtf_pwd.result
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = data.azurerm_client_config.trtf_cc.object_id
  }
}

resource "azurerm_mssql_database" "trtf_db" {
  name           = "theoruf-db"
  server_id      = azurerm_mssql_server.trtf_mysql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb    = 4
  read_scale     = false
  sku_name       = "GP_S_Gen5_2"
  min_capacity   = 1
  enclave_type   = "VBS"
  auto_pause_delay_in_minutes = 60
}
*/