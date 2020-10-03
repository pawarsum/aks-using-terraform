provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_pet" "prefix" {
  prefix = var.prefix
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${random_pet.prefix.id}-k8s"

  default_node_pool {
    name       = "default"
    node_count = var.nodecount
    vm_size    = var.vmsize
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  linux_profile{
      admin_username = "kuberoot"
      ssh_key {
      key_data = file("~/.ssh/id_rsa.pub")
      }
  }

  tags = var.tags
}