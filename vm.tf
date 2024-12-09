/*
resource "azurerm_virtual_machine" "trtf_vm" {
  name                  = "Ubuntu-trtf"
  location              = azurerm_resource_group.trtf-rg-map["rg1"].location
  resource_group_name   = azurerm_resource_group.trtf-rg-map["rg1"].name
  network_interface_ids = [azurerm_network_interface.trtf_net_int.id]
  vm_size               = "Standard_DS2_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "ubntdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "Ubnt01"
    admin_username = "theo_ruf"
    admin_password = random_password.trtf_pwd.result
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
*/