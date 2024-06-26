Palo Alto Networks PAN-OS NAT Policies Module
---
This Terraform module allows users to configure NAT policies.

Usage
---

1. Create a **"main.tf"** file with the following content:

```terraform
module "nat_policies" {
  source  = "PaloAltoNetworks/terraform-panos-ngfw-modules//modules/nat_policies"

  mode = "panorama" # If you want to use this module with a firewall, change this to "ngfw"

  device_group = "test"
  nat_policies = {
    "required_nat" = {
        rulebase = "pre-rulebase"
        rules = [
        {
          name = "DNS config rule"
          tags = [
            "dns-proxy",
            "Managed by Terraform"
          ]
          original_packet = {
            destination_addresses = ["any"]
            destination_zone      = "Trust-L3"
            source_addresses      = ["any"]
            source_zones          = ["Untrust-L3"]
            service               = "any"
          }
          translated_packet = {
            source = {
              dynamic_ip = {
              translated_addresses = ["DNS-Servers"]
              }
            }
            destination = {
              static_translation = {
              address = "2.2.2.2"
              port    = "80"
              }
            }
          }
        }
      ]
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
| [panos_nat_rule_group.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/nat_rule_group) | resource |
| [panos_panorama_nat_rule_group.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/panorama_nat_rule_group) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mode"></a> [mode](#input\_mode) | The mode to use for the modules. Valid values are `panorama` and `ngfw`. | `string` | n/a | yes |
| <a name="input_device_group"></a> [device\_group](#input\_device\_group) | Used if _mode_ is panorama, this defines the Device Group for the deployment | `string` | `"shared"` | no |
| <a name="input_vsys"></a> [vsys](#input\_vsys) | Used if _mode_ is ngfw, this defines the vsys for the deployment | `string` | `"vsys1"` | no |
| <a name="input_nat_policies"></a> [nat\_policies](#input\_nat\_policies) | Map with NAT policy rule objects.<br>- `rulebase`: (optional) The rulebase for the NAT Policy. Valid values are `pre-rulebase` and `post-rulebase` (default: `pre-rulebase`).<br>- `position_keyword`: (optional) A positioning keyword for this group. Valid values are `before`, `directly before`, `after`, `directly after`, `top`, `bottom`, or left empty to have no particular placement (default: empty). This parameter works in combination with the `position_reference` parameter.<br>- `position_reference`: (optional) Required if `position_keyword` is one of the "above" or "below" variants, this is the name of a non-group rule to use as a reference to place this group.<br>- `rules`: (optional) The NAT rule definition. The NAT rule ordering will match how they appear in the terraform plan file.<br>  - `name`: (required) The NAT rule's name.<br>  - `description`: (optional) The description of the NAT rule.<br>  - `audit_comment`: (optional) When this rule is created/updated, the audit comment to apply for this rule.<br>  - `type`: (optional) NAT type. Valid values are `ipv4`, `nat64`, or `nptv6` (default: `ipv4`).<br>  - `tags`: (optional) List of administrative tags.<br>  - `disabled`: (optional) Boolean designating if the security policy rule is disabled (default: `false`).<br>  - `group_tag`: (optional) The group tag.<br>  - `uuid`: (optional) The PAN-OS UUID.<br>  - `original_packet`: (required) The original packet specification.<br>    - `source_zones`: (optional) List of source zones (default: `any`).<br>    - `destination_zone`: (optional) The destination zone (default: `any`).<br>    - `destination_interface`: (optional) Egress interface from the lookup (default: `any`).<br>    - `service`: (optional) Service for the original packet (default: `any`).<br>    - `source_addresses`: (optional) List of source addresses (default: `any`).<br>    - `destination_addresses`: (optional) List of destination addresses (default: `any`).<br>  - `translated_packet`: (required) The translated packet specifications.<br>    - `source`: (optional) The source specification. Valid values are `none`, `dynamic_ip_port`, `dynamic_ip`, or `static_ip` (default: `none`).<br>      - `dynamic_ip_and_port`: (optional) Dynamic IP and port source translation specification.<br>        - `translated_addresses`: (optional) Not functional if `interface_address` is configured. List of translated addresses.<br>        - `interface_address`: (optional) Not functional if `translated_addresses` is configured. Interface address source translation type specifications.<br>          - `interface`: (required) The interface.<br>          - `ip_address`: (optional) The IP address.<br>      - `dynamic_ip`: (optional) Dynamic IP source translation specification.<br>        - `translated_addresses`: (optional) The list of translated addresses.<br>        - `fallback`: (optional) The fallback specifications.<br>          - `translated_addresses`: (optional) Not functional if `interface_address` is configured. List of translated addresses.<br>          - `interface_address`: (optional) Not functional if `translated address` is configured. The interface address fallback specifications.<br>            - `interface`: (required) Source address translated fallback interface.<br>            - `type`: (optional) Type of interface fallback. Valid values are `ip` or `floating` (default: `ip`).<br>            - `ip_address`: (optional) IP address of the fallback interface.<br>      - `static_ip`: (optional) Static IP source translation specifications.<br>        - `translated_address`: (required) The statically translated source address.<br>        - `bi_directional`: (optional) Boolean enabling bi-directional source address translation (default: `false`).<br>    - `destination`: (optional) The destination specification. Valid values are `none`, `static_translation`, or `dynamic_translation` (default: `none`).<br>      - `static_translation`: (optional) Specifies a static destination NAT.<br>        - `address`: (required) Destination address translation address.<br>        - `port`: (optional) Integer destination address translation port number.<br>      - `dynamic_translation`: (optional) Specify a dynamic destination NAT. Only available for PAN-OS 8.1+.<br>        - `address`: (required) Destination address translation address.<br>        - `port`: (optional) Integer destination address translation port number.<br>        - `distribution`: (optional) Distribution algorithm for destination address pool. Valid values are `round-robin`, `source-ip-hash`, `ip-modulo`, `ip-hash`, or `least-sessions` (default: `round-robin`). Only available for PAN-OS 8.1+.<br><br>Example:<pre>"required_nat" = {<br>  rulebase = "pre-rulebase"<br>  rules    = [<br>    {<br>      name = "DNS config rule"<br>      tags = [<br>        "dns-proxy",<br>        "Managed by Terraform"<br>      ]<br>      original_packet = {<br>        destination_addresses = ["any"]<br>        destination_zone      = "Trust-L3"<br>        source_addresses      = ["any"]<br>        source_zones          = ["Untrust-L3"]<br>        service               = "any"<br>      }<br>      translated_packet = {<br>        source = {<br>          dynamic_ip = {<br>            translated_addresses = ["DNS-Servers"]<br>            fallback = {<br>              interface_address = {<br>                interface = "ethernet1/1"<br>              }<br>            }<br>          }<br>        }<br>        destination = {<br>          static_translation = {<br>            address = "2.2.2.2"<br>            port    = "80"<br>          }<br>        }<br>      }<br>    }<br>  ]<br>}</pre> | <pre>map(object({<br>    rulebase           = optional(string, "pre-rulebase")<br>    position_keyword   = optional(string, "")<br>    position_reference = optional(string)<br>    rules = list(object({<br>      name          = string<br>      audit_comment = optional(string)<br>      description   = optional(string)<br>      tags          = optional(list(string))<br>      type          = optional(string, "ipv4")<br>      disabled      = optional(bool, false)<br>      group_tag     = optional(string)<br>      uuid          = optional(string)<br>      original_packet = object({<br>        destination_addresses = optional(list(string), ["any"])<br>        destination_zone      = string<br>        destination_interface = optional(string, "any")<br>        source_addresses      = optional(list(string), ["any"])<br>        source_zones          = list(string)<br>        service               = optional(string, "any")<br>      })<br>      translated_packet = optional(object({<br>        destination = optional(object({<br>          static_translation = optional(object({<br>            address = string<br>            port    = optional(string)<br>          }))<br>          dynamic_translation = optional(object({<br>            address      = optional(string)<br>            port         = optional(string)<br>            distribution = optional(string)<br>          }))<br>        }))<br>        source = optional(object({<br>          dynamic_ip_and_port = optional(object({<br>            translated_address = optional(object({<br>              translated_addresses = optional(list(string))<br>            }))<br>            interface_address = optional(object({<br>              interface  = string<br>              ip_address = optional(string)<br>            }))<br>          }))<br>          dynamic_ip = optional(object({<br>            translated_addresses = list(string)<br>            fallback = optional(object({<br>              translated_address = optional(object({<br>                translated_addresses = list(string)<br>              }))<br>              interface_address = optional(object({<br>                interface  = string<br>                type       = optional(string)<br>                ip_address = optional(string, "ip")<br>              }))<br>            }))<br>          }))<br>          static_ip = optional(object({<br>            translated_address = string<br>            bi_directional     = optional(bool)<br>          }))<br>        }))<br>      }))<br>      negate_target = optional(bool, false)<br>      target = optional(list(object({<br>        serial    = string<br>        vsys_list = optional(list(string))<br>      })), null)<br>    }))<br>  }))</pre> | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_panos_panorama_nat_rule_group"></a> [panos\_panorama\_nat\_rule\_group](#output\_panos\_panorama\_nat\_rule\_group) | n/a |
| <a name="output_panos_nat_rule_group"></a> [panos\_nat\_rule\_group](#output\_panos\_nat\_rule\_group) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->