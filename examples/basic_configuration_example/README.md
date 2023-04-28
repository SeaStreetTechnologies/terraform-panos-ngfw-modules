<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0, < 2.0.0 |
| <a name="requirement_panos"></a> [panos](#requirement\_panos) | ~> 1.11.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_address_groups"></a> [address\_groups](#module\_address\_groups) | ../../modules/addresses | n/a |
| <a name="module_addresses"></a> [addresses](#module\_addresses) | ../../modules/addresses | n/a |
| <a name="module_device_groups"></a> [device\_groups](#module\_device\_groups) | ../../modules/device-groups | n/a |
| <a name="module_interfaces"></a> [interfaces](#module\_interfaces) | ../../modules/interfaces | n/a |
| <a name="module_ipsec"></a> [ipsec](#module\_ipsec) | ../../modules/ipsec | n/a |
| <a name="module_management_profiles"></a> [management\_profiles](#module\_management\_profiles) | ../../modules/management-profiles | n/a |
| <a name="module_security_policies"></a> [security\_policies](#module\_security\_policies) | ../../modules/security-policies | n/a |
| <a name="module_service_groups"></a> [service\_groups](#module\_service\_groups) | ../../modules/services | n/a |
| <a name="module_services"></a> [services](#module\_services) | ../../modules/services | n/a |
| <a name="module_static_routes"></a> [static\_routes](#module\_static\_routes) | ../../modules/static-routes | n/a |
| <a name="module_tags"></a> [tags](#module\_tags) | ../../modules/tags | n/a |
| <a name="module_template_stacks"></a> [template\_stacks](#module\_template\_stacks) | ../../modules/template-stacks | n/a |
| <a name="module_templates"></a> [templates](#module\_templates) | ../../modules/templates | n/a |
| <a name="module_virtual_routers"></a> [virtual\_routers](#module\_virtual\_routers) | ../../modules/virtual-routers | n/a |
| <a name="module_zones"></a> [zones](#module\_zones) | ../../modules/zones | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_groups"></a> [address\_groups](#input\_address\_groups) | Address groups object | `any` | `{}` | no |
| <a name="input_addresses"></a> [addresses](#input\_addresses) | Address object | `any` | `{}` | no |
| <a name="input_device_groups"></a> [device\_groups](#input\_device\_groups) | Used if `var.mode` is panorama, this defines the Device Group for the deployment | `any` | `{}` | no |
| <a name="input_ike_crypto_profiles"></a> [ike\_crypto\_profiles](#input\_ike\_crypto\_profiles) | n/a | `any` | n/a | yes |
| <a name="input_ike_gateways"></a> [ike\_gateways](#input\_ike\_gateways) | n/a | `any` | n/a | yes |
| <a name="input_interfaces"></a> [interfaces](#input\_interfaces) | n/a | `any` | n/a | yes |
| <a name="input_ipsec_crypto_profiles"></a> [ipsec\_crypto\_profiles](#input\_ipsec\_crypto\_profiles) | n/a | `any` | n/a | yes |
| <a name="input_ipsec_tunnels"></a> [ipsec\_tunnels](#input\_ipsec\_tunnels) | n/a | `any` | n/a | yes |
| <a name="input_management_profiles"></a> [management\_profiles](#input\_management\_profiles) | n/a | `any` | n/a | yes |
| <a name="input_mode"></a> [mode](#input\_mode) | Provide information about target. | `string` | `""` | no |
| <a name="input_pan_creds"></a> [pan\_creds](#input\_pan\_creds) | Path to file with credentials to Panorama | `string` | n/a | yes |
| <a name="input_security_policies"></a> [security\_policies](#input\_security\_policies) | Security policies | `any` | `{}` | no |
| <a name="input_service_groups"></a> [service\_groups](#input\_service\_groups) | Service groups object | `any` | `{}` | no |
| <a name="input_services"></a> [services](#input\_services) | Services object | `any` | `{}` | no |
| <a name="input_static_routes"></a> [static\_routes](#input\_static\_routes) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags object | `any` | `{}` | no |
| <a name="input_template_stacks"></a> [template\_stacks](#input\_template\_stacks) | n/a | `any` | n/a | yes |
| <a name="input_templates"></a> [templates](#input\_templates) | n/a | `any` | n/a | yes |
| <a name="input_virtual_routers"></a> [virtual\_routers](#input\_virtual\_routers) | n/a | `any` | n/a | yes |
| <a name="input_vsys"></a> [vsys](#input\_vsys) | Used if `var.mode` is ngfw, this defines the vsys for the deployment | `string` | `"vsys1"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->