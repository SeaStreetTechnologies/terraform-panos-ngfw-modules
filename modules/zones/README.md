Palo Alto Networks PAN-OS Zones Module
---
This Terraform module allows users to configure zones.

Usage
---

1. Create a **"main.tf"** file with the following content:

```terraform
module "zones" {
  source  = "PaloAltoNetworks/terraform-panos-ngfw-modules//modules/zones"

  mode = "panorama" # If you want to use this module with a firewall, change this to "ngfw"

  template = "test"
  zones = {
    "Trust-L3" = {
      mode = "layer3"
    }
    "Untrust-L3" = {
      mode = "layer3"
    }
  }
}
```

2. Run Terraform

```
terraform init
terraform apply
terraform output
```

Cleanup
---

```
terraform destroy
```

Compatibility
---
This module is meant for use with **PAN-OS >= 10.2** and **Terraform >= 1.4.0**


Reference
---
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0, < 2.0.0 |
| <a name="requirement_panos"></a> [panos](#requirement\_panos) | ~> 1.11.1 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_panos"></a> [panos](#provider\_panos) | ~> 1.11.1 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [panos_zone.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/zone) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mode"></a> [mode](#input\_mode) | The mode to use for the modules. Valid values are `panorama` and `ngfw`. | `string` | n/a | yes |
| <a name="input_template"></a> [template](#input\_template) | The template name. | `string` | `"default"` | no |
| <a name="input_template_stack"></a> [template\_stack](#input\_template\_stack) | The template stack name. | `string` | `""` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Map of the zones, where key is the zone's name:<br>- `vsys` - The vsys (default: vsys1)<br>- `mode` - (Required) The zone's mode. This can be layer3, layer2, virtual-wire, tap, or tunnel.<br>- `zone_profile` - The zone protection profile.<br>- `log_setting` - Log setting.<br>- `enable_user_id` - Boolean to enable user identification.<br>- `interfaces` - List of interfaces to associated with this zone. Leave this undefined if you want to use panos\_zone\_entry resources.<br>- `include_acls` - Users from these addresses/subnets will be identified. This can be an address object, an address group, a single IP address, or an IP address subnet.<br>- `exclude_acls` - Users from these addresses/subnets will not be identified. This can be an address object, an address group, a single IP address, or an IP address subnet.<br><br>Example:<pre>{<br>  "default" = {}<br>}</pre> | <pre>map(object({<br>    vsys           = optional(string, "vsys1")<br>    mode           = optional(string)<br>    zone_profile   = optional(string)<br>    log_setting    = optional(string)<br>    enable_user_id = optional(bool)<br>    interfaces     = optional(list(string))<br>    include_acls   = optional(list(string))<br>    exclude_acls   = optional(list(string))<br>  }))</pre> | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_zones"></a> [zones](#output\_zones) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
