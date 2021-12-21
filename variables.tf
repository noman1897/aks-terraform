variable "location" {
  description = "Specifies the location for the resource group and all the resources"
  default     = "uksouth"
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the resource group name"
  default     = "kxRG"
  type        = string
}

variable "vnet_name" {
  description = "Specifies the name of the AKS vnet"
  default     = "AkskxVNet"
  type        = string
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["Akskxsubnet"]
}

variable "vnet_address_space" {
  description = "Specifies the address space of the vnet"
  default     = "10.0.0.0/16"
  type        = string
}


variable "subnet_address_prefix" {
  description = "Specifies the address prefix of the subnet"
  default     = ["10.0.0.0/21"]
  type        = list(string)
}

variable "aks_cluster_name" {
  description = "(Required) Specifies the name of the AKS cluster."
  default     = "kxManAks"
  type        = string
}

variable "kubernetes_version" {
  description = "Specifies the AKS Kubernetes version"
  default     = "1.22.2"
  type        = string
}

variable "default_node_pool_name" {
  description = "Specifies the name of the default node pool"
  default     = "system"
  type        = string
}

variable "default_node_pool_availability_zones" {
  description = "Specifies the availability zones of the default node pool"
  default     = ["1", "2", "3"]
  type        = list(string)
}

variable "network_docker_bridge_cidr" {
  description = "Specifies the Docker bridge CIDR"
  default     = "172.17.0.1/16"
  type        = string
}

variable "network_dns_service_ip" {
  description = "Specifies the DNS service IP"
  default     = "10.2.0.10"
  type        = string
}

variable "network_service_cidr" {
  description = "Specifies the service CIDR"
  default     = "10.2.0.0/24"
  type        = string
}

variable "network_plugin" {
  description = "Specifies the network plugin of the AKS cluster"
  default     = "azure"
  type        = string
}


variable "tags" {
  description = "(Optional) Specifies tags for all the resources"
  default = {
    createdWith = "Terraform"
  }
}



#VM Variable

variable "source_address_prefix" {
  description = "(Optional) Specifies the  CIDR or source IP range or * to match any IP."
  type        = string
  default     = "*"
}

variable "vm_name" {
  description = "Specifies the name of the jumpbox virtual machine"
  default     = "BastionVmkx"
  type        = string
}

variable "vm_public_ip" {
  description = "(Optional) Specifies whether create a public IP for the virtual machine"
  type        = bool
  default     = true
}

variable "domain_name_label" {
  description = "Specifies the domain name for the jumbox virtual machine"
  default     = "Bastionvmkx"
  type        = string
}


variable "admin_username" {
  description = "(Required) Specifies the admin username of the jumpbox virtual machine and AKS worker nodes."
  type        = string
  default     = "azadmin"
}

variable "vm_size" {
  description = "Specifies the size of the jumpbox virtual machine"
  default     = "Standard_DS1_v2"
  type        = string
}


variable "vm_os_disk_image" {
  type        = map(string)
  description = "Specifies the os disk image of the virtual machine"
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
