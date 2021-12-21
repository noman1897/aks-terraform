terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.60"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "kxtf"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}


resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/virtual_network"
  vnet_name           = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  subnet_prefixes     = var.subnet_address_prefix
  subnet_names        = var.subnet_names
  depends_on          = [azurerm_resource_group.rg]
  tags     = var.tags
}



module "aks" {
  source                           = "./modules/aks"
  resource_group_name              = azurerm_resource_group.rg.name
  kubernetes_version               = var.kubernetes_version
  orchestrator_version             = var.kubernetes_version
  prefix                           = "aks"
  cluster_name                     = var.aks_cluster_name
  network_plugin                   = var.network_plugin
  vnet_subnet_id                   = module.network.vnet_subnets[0]
  os_disk_size_gb                  = 50
  private_cluster_enabled          = true # default value
  enable_azure_policy              = true
  enable_auto_scaling              = true
  agents_min_count                 = 1
  agents_max_count                 = 2
  agents_count                     = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
  agents_max_pods                  = 100
  agents_pool_name                 = var.default_node_pool_name
  agents_availability_zones        = var.default_node_pool_availability_zones
  agents_type                      = "VirtualMachineScaleSets"
  enable_log_analytics_workspace   = false
  agents_labels = {
    "nodepool" : "defaultnodepool"
  }

  agents_tags = {
    "Agent" : "defaultnodepoolagent"
  }

  network_policy                 = "azure"
  net_profile_dns_service_ip     = var.network_dns_service_ip
  net_profile_docker_bridge_cidr = var.network_docker_bridge_cidr
  net_profile_service_cidr       = var.network_service_cidr
  tags     = var.tags
  depends_on = [module.network]
}


module "virtual_machine" {
  source                              = "./modules/virtual_machine"
  name                                = var.vm_name
  size                                = var.vm_size
  location                            = var.location
  public_ip                           = var.vm_public_ip
  vm_user                             = var.admin_username
  os_disk_image                       = var.vm_os_disk_image
  domain_name_label                   = var.domain_name_label
  source_address_prefix               = var.source_address_prefix
  resource_group_name                 = azurerm_resource_group.rg.name
  subnet_id                           = module.network.vnet_subnets[0]
  tags     = var.tags
  depends_on = [module.network]
}
