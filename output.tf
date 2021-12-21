output "aks_name" {
  description = "Aks's name"
  value       = var.aks_cluster_name
}

output "aks_rg" {
  description = "Aks's resource group"
  value       = var.resource_group_name
}

output "public_ip" {
  description = "The public IP address of the virtual machine"
  value       = module.virtual_machine.public_ip
}

output "username" {
  description = "The username of the virtual machine"
  value       = module.virtual_machine.username
}

output "username_password" {
  description = "The username of the virtual machine"
  value = nonsensitive(module.virtual_machine.username_password)
}

resource "local_file" "kubeconfig" {
  filename     = "kubeconfig"
  content      = module.aks.kube_config_raw
}

