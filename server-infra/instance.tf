resource "azurerm_linux_virtual_machine" "example" {
  # Name der virtuellen Maschine
  name                  = "my-vm"
  # Standort der virtuellen Maschine
  location              = "${azurerm_resource_group.example.location}"
  # Name der Resource Group, in der die virtuelle Maschine erzeugt wird
  resource_group_name   = "${azurerm_resource_group.example.name}"
  # ID der Network Interface, die der virtuellen Maschine zugewiesen wird
  network_interface_ids = ["${azurerm_network_interface.example.id}"]
  # Größe der virtuellen Maschine
  size               = "Standard_B2s"
  admin_username       = "ubuntu"
  # Konfiguration der Identity
  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  # Konfiguration des Storage OS Disk
  os_disk {
    name              = "my-os-disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"  # Define storage account type here
  }
  admin_ssh_key {
    username   = "ubuntu"
    public_key = var.ssh-key
  }
  
  custom_data = data.cloudinit_config.ansible.rendered
}

resource "null_resource" "softwareconfig" {

   provisioner "file" {
   source      = "./playbook.yml"
   destination = "./playbook.yml"
   connection {
    type = "ssh"
    host = azurerm_public_ip.example.ip_address
    user = "ubuntu"
    port = 22
    private_key = file("~/myagent/_work/_temp/temp")
  }
}
 depends_on = [
    azurerm_linux_virtual_machine.example,
    azurerm_public_ip.example
  ]
}
output "NewIP" {
value = azurerm_public_ip.example.ip_address
}
