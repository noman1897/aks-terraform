<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 2.60 |

Need a azure account access with a **az storage container** to be used as **backend** for the statefile of the project
A backend sample configuration is available in the **main.tf** file, please adjust with the personalized config and export the var `export ARM_ACCESS_KEY=` with appropiate key for the storage.

## Steps

To configure the ** IP Address/Range** for the access to the bastionvm please configure the specific var in the ___variables.tf___ as **source_address_prefix**.


`terraform init`

`terraform plan`

`terraform apply`

The resource created are listed below in the configured **az resource group** in the ___variables.tf___ file in root.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.60 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | ./modules/aks | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/virtual_network | n/a |
| <a name="module_virtual_machine"></a> [virtual\_machine](#module\_virtual\_machine) | ./modules/virtual_machine | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/2.60/docs/resources/resource_group) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | (Required) Specifies the admin username of the jumpbox virtual machine and AKS worker nodes. | `string` | `"azadmin"` | no |
| <a name="input_aks_cluster_name"></a> [aks\_cluster\_name](#input\_aks\_cluster\_name) | (Required) Specifies the name of the AKS cluster. | `string` | `"kxManAks"` | no |
| <a name="input_default_node_pool_availability_zones"></a> [default\_node\_pool\_availability\_zones](#input\_default\_node\_pool\_availability\_zones) | Specifies the availability zones of the default node pool | `list(string)` | <pre>[<br>  "1",<br>  "2",<br>  "3"<br>]</pre> | no |
| <a name="input_default_node_pool_name"></a> [default\_node\_pool\_name](#input\_default\_node\_pool\_name) | Specifies the name of the default node pool | `string` | `"system"` | no |
| <a name="input_domain_name_label"></a> [domain\_name\_label](#input\_domain\_name\_label) | Specifies the domain name for the jumbox virtual machine | `string` | `"Bastionvmkx"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Specifies the AKS Kubernetes version | `string` | `"1.22.2"` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the location for the resource group and all the resources | `string` | `"uksouth"` | no |
| <a name="input_network_dns_service_ip"></a> [network\_dns\_service\_ip](#input\_network\_dns\_service\_ip) | Specifies the DNS service IP | `string` | `"10.2.0.10"` | no |
| <a name="input_network_docker_bridge_cidr"></a> [network\_docker\_bridge\_cidr](#input\_network\_docker\_bridge\_cidr) | Specifies the Docker bridge CIDR | `string` | `"172.17.0.1/16"` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Specifies the network plugin of the AKS cluster | `string` | `"azure"` | no |
| <a name="input_network_service_cidr"></a> [network\_service\_cidr](#input\_network\_service\_cidr) | Specifies the service CIDR | `string` | `"10.2.0.0/24"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the resource group name | `string` | `"kxRG"` | no |
| <a name="input_source_address_prefix"></a> [source\_address\_prefix](#input\_source\_address\_prefix) | (Optional) Specifies the  CIDR or source IP range or * to match any IP. | `string` | `"*"` | no |
| <a name="input_subnet_address_prefix"></a> [subnet\_address\_prefix](#input\_subnet\_address\_prefix) | Specifies the address prefix of the subnet | `list(string)` | <pre>[<br>  "10.0.0.0/21"<br>]</pre> | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | A list of public subnets inside the vNet. | `list(string)` | <pre>[<br>  "Akskxsubnet"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Specifies tags for all the resources | `map` | <pre>{<br>  "createdWith": "Terraform"<br>}</pre> | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Specifies the name of the jumpbox virtual machine | `string` | `"BastionVmkx"` | no |
| <a name="input_vm_os_disk_image"></a> [vm\_os\_disk\_image](#input\_vm\_os\_disk\_image) | Specifies the os disk image of the virtual machine | `map(string)` | <pre>{<br>  "offer": "UbuntuServer",<br>  "publisher": "Canonical",<br>  "sku": "18.04-LTS",<br>  "version": "latest"<br>}</pre> | no |
| <a name="input_vm_public_ip"></a> [vm\_public\_ip](#input\_vm\_public\_ip) | (Optional) Specifies whether create a public IP for the virtual machine | `bool` | `true` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Specifies the size of the jumpbox virtual machine | `string` | `"Standard_DS1_v2"` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | Specifies the address space of the vnet | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Specifies the name of the AKS vnet | `string` | `"AkskxVNet"` | no |

## Outputs

After the successful run of **terraform apply** you can obtain this as the output of the script:

| Name | Description |
|------|-------------|
| <a name="output_aks_name"></a> [aks\_name](#output\_aks\_name) | Aks's name |
| <a name="output_aks_rg"></a> [aks\_rg](#output\_aks\_rg) | Aks's resource group |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP address of the virtual machine |
| <a name="output_username"></a> [username](#output\_username) | The username of the virtual machine |
| <a name="output_username_password"></a> [username\_password](#output\_username\_password) | The username of the virtual machine |

The connection to the newly created vm will be permitted to the ip/range configured in **source_address_prefix** var and currently there is password authentication(cert not configured) to access the public ip adress of the vm.

`ssh user-output@ip-output`

Custom script **bastionvm-setup.sh** available to copy in the new vm to install kubectl,helm and az cli.

To check the connection to the aks cluster is possible to:

* Use the kubeconfig available in the terraform output and connect to aks with `kubectl --kubeconfig ./kubeconfig config get-contexts`
* Get the aks credentials using the az cli with the login and ``az login \ az aks browse --resource-group $(terraform output -raw aks_rg) --name $(terraform output -raw aks_name)``

## Documentation
https://registry.terraform.io/modules/Azure/aks/azurerm/latest

https://registry.terraform.io/modules/Azure/network/azurerm/latest

https://docs.microsoft.com/en-us/azure/aks/private-clusters

https://docs.microsoft.com/en-us/samples/azure-samples/private-aks-cluster-terraform-devops/private-aks-cluster-terraform-devops/

<!-- END_TF_DOCS -->

