<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0, < 2.0.0 |
| <a name="requirement_panos"></a> [panos](#requirement\_panos) | ~> 1.11.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_panos"></a> [panos](#provider\_panos) | ~> 1.11.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [panos_ethernet_interface.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/ethernet_interface) | resource |
| [panos_loopback_interface.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/loopback_interface) | resource |
| [panos_panorama_ethernet_interface.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/panorama_ethernet_interface) | resource |
| [panos_panorama_loopback_interface.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/panorama_loopback_interface) | resource |
| [panos_panorama_tunnel_interface.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/panorama_tunnel_interface) | resource |
| [panos_tunnel_interface.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/tunnel_interface) | resource |
| [panos_virtual_router_entry.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/virtual_router_entry) | resource |
| [panos_zone_entry.this](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/zone_entry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_interfaces"></a> [interfaces](#input\_interfaces) | Map of the interfaces, where key is the interface's name:<br>- `type` - (Required) Type of interface. Valid values are `ethernet`,`loopback`,`tunnel`.<br>- `mode` - (Required) The interface mode. This can be any of the following values: layer3, layer2, virtual-wire, tap, ha, decrypt-mirror, or aggregate-group.<br>- `zone` - (Required) The zone's name<br>- `virtual_router` - (Required) The virtual router's name<br>- `vsys` - (Optional) The vsys that will use this interface (default: vsys1). This should be something like vsys1 or vsys3.<br>- `static_ips` - (Optional) List of static IPv4 addresses to set for this data interface.<br>- `enable_dhcp` - (Optional) Set to true to enable DHCP on this interface.<br>- `create_dhcp_default_route` - (Optional) Set to true to create a DHCP default route.<br>- `dhcp_default_route_metric` - (Optional) The metric for the DHCP default route.<br>- `ipv6_enabled` - (Optional) Set to true to enable IPv6.<br>- `management_profile` - (Optional) The management profile.<br>- `mtu` - (Optional) The MTU.<br>- `adjust_tcp_mss` - (Optional) Adjust TCP MSS (default: false).<br>- `netflow_profile - (Optional) The netflow profile.<br>- `lldp\_enabled` - (Optional) Enable LLDP (default: false).<br>- `lldp\_profile` - (Optional) LLDP profile.<br>- `lldp\_ha\_passive\_pre\_negotiation` - (bool) LLDP HA passive pre-negotiation.<br>- `lacp\_ha\_passive\_pre\_negotiation` - (bool) LACP HA passive pre-negotiation.<br>- `link\_speed` - (Optional) Link speed. This can be any of the following: 10, 100, 1000, or auto.<br>- `link\_duplex` - (Optional) Link duplex setting. This can be full, half, or auto.<br>- `link\_state` - (Optional) The link state. This can be up, down, or auto.<br>- `aggregate\_group` - (Optional) The aggregate group (applicable for physical firewalls only).<br>- `comment` - (Optional) The interface comment.<br>- `lacp\_port\_priority` - (int) LACP port priority.<br>- `ipv4\_mss\_adjust` - (Optional, PAN-OS 7.1+) The IPv4 MSS adjust value.<br>- `ipv6\_mss\_adjust` - (Optional, PAN-OS 7.1+) The IPv6 MSS adjust value.<br>- `decrypt\_forward` - (Optional, PAN-OS 8.1+) Enable decrypt forwarding.<br>- `rx\_policing\_rate` - (Optional, PAN-OS 8.1+) Receive policing rate in Mbps.<br>- `tx\_policing\_rate` - (Optional, PAN-OS 8.1+) Transmit policing rate in Mbps.<br>- `dhcp\_send\_hostname\_enable` - (Optional, PAN-OS 9.0+) For DHCP layer3 interfaces: enable sending the firewall or a custom hostname to DHCP server<br>- `dhcp\_send\_hostname\_value` - (Optional, PAN-OS 9.0+) For DHCP layer3 interfaces: the interface hostname. Leaving this unspecified with dhcp_send_hostname_enable set means to send the system hostname.<br><br>Example:<br>`<pre>{<br>  "ethernet1/1" = {<br>    type                      = "ethernet"<br>    mode                      = "layer3"<br>    management_profile        = "mgmt_default"<br>    link_state                = "up"<br>    enable_dhcp               = true<br>    create_dhcp_default_route = false<br>    comment                   = "mgmt"<br>    virtual_router            = "default"<br>    zone                      = "mgmt"<br>    vsys                      = "vsys1"<br>  }<br>}</pre> | <pre>map(object({<br>    type                            = string<br>    mode                            = string<br>    zone                            = string<br>    virtual_router                  = string<br>    vsys                            = optional(string, "vsys1")<br>    static_ips                      = optional(list(string), [])<br>    enable_dhcp                     = optional(bool, false)<br>    create_dhcp_default_route       = optional(bool, false)<br>    dhcp_default_route_metric       = optional(number)<br>    ipv6_enabled                    = optional(bool)<br>    management_profile              = optional(string)<br>    mtu                             = optional(number)<br>    adjust_tcp_mss                  = optional(bool, false)<br>    netflow_profile                 = optional(string)<br>    lldp_enabled                    = optional(bool, false)<br>    lldp_profile                    = optional(string)<br>    lldp_ha_passive_pre_negotiation = optional(bool)<br>    lacp_ha_passive_pre_negotiation = optional(bool)<br>    link_speed                      = optional(string)<br>    link_duplex                     = optional(string)<br>    link_state                      = optional(string)<br>    aggregate_group                 = optional(string)<br>    comment                         = optional(string)<br>    lacp_port_priority              = optional(number)<br>    ipv4_mss_adjust                 = optional(string)<br>    ipv6_mss_adjust                 = optional(string)<br>    decrypt_forward                 = optional(bool)<br>    rx_policing_rate                = optional(string)<br>    tx_policing_rate                = optional(string)<br>    dhcp_send_hostname_enable       = optional(bool)<br>    dhcp_send_hostname_value        = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | The mode to use for the modules. Valid values are `panorama` and `ngfw`. | `string` | n/a | yes |
| <a name="input_mode_map"></a> [mode\_map](#input\_mode\_map) | The mode to use for the modules. Valid values are `panorama` and `ngfw`. | <pre>object({<br>    panorama = number<br>    ngfw     = number<br>  })</pre> | <pre>{<br>  "ngfw": 1,<br>  "panorama": 0<br>}</pre> | no |
| <a name="input_template"></a> [template](#input\_template) | The template name. | `string` | `"default"` | no |
| <a name="input_template_stack"></a> [template\_stack](#input\_template\_stack) | The template stack name. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ethernet_interfaces"></a> [ethernet\_interfaces](#output\_ethernet\_interfaces) | n/a |
| <a name="output_loopback_interfaces"></a> [loopback\_interfaces](#output\_loopback\_interfaces) | n/a |
| <a name="output_panorama_ethernet_interfaces"></a> [panorama\_ethernet\_interfaces](#output\_panorama\_ethernet\_interfaces) | n/a |
| <a name="output_panorama_loopback_interfaces"></a> [panorama\_loopback\_interfaces](#output\_panorama\_loopback\_interfaces) | n/a |
| <a name="output_panorama_tunnel_interfaces"></a> [panorama\_tunnel\_interfaces](#output\_panorama\_tunnel\_interfaces) | n/a |
| <a name="output_tunnel_interfaces"></a> [tunnel\_interfaces](#output\_tunnel\_interfaces) | n/a |
| <a name="output_virtual_router_entries"></a> [virtual\_router\_entries](#output\_virtual\_router\_entries) | n/a |
| <a name="output_zone_entries"></a> [zone\_entries](#output\_zone\_entries) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->