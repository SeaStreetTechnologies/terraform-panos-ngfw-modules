variable "mode" {
  description = "The mode to use for the modules. Valid values are `panorama` and `ngfw`."
  type        = string
  validation {
    condition     = contains(["panorama", "ngfw"], var.mode)
    error_message = "The mode must be either `panorama` or `ngfw`."
  }
}

variable "mode_map" {
  description = "The mode to use for the modules. Valid values are `panorama` and `ngfw`."
  default = {
    panorama = 0
    ngfw     = 1
    # cloud_manager = 2 # Not yet supported
  }
  type = object({
    panorama = number
    ngfw     = number
  })
}

variable "device_group" {
  description = "Used if _mode_ is panorama, this defines the Device Group for the deployment"
  default     = "shared"
  type        = string
}

variable "vsys" {
  description = "Used if _mode_ is ngfw, this defines the vsys for the deployment"
  default     = "vsys1"
  type        = string
}

variable "tags" {
  description = <<-EOF
  Map of the tag objects, where key is the tag object's name:
  - `color`: (optional) The tag's color. This should either be an empty string (no color) or a string such as `color1`.
  - `comment`: (optional) The description of the administrative tag.

  Example:
  ```
  tags = {
    DNS-SRV = {
      comment = "Tag for DNS servers"
    }
    dns-proxy = {
      color   = "Olive"
      comment = "dns-proxy"
    }
  }
  ```
  EOF
  default     = {}
  type = map(object({
    color   = optional(string)
    comment = optional(string)
  }))
}

variable "tag_color_map" {
  description = "Map of tag-color match, [provider documentation](https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs/resources/administrative_tag)"
  default = {
    red            = "color1"
    green          = "color2"
    blue           = "color3"
    yellow         = "color4"
    copper         = "color5"
    orange         = "color6"
    purple         = "color7"
    gray           = "color8"
    light_green    = "color9"
    cyan           = "color10"
    light_gray     = "color11"
    blue_gray      = "color12"
    lime           = "color13"
    black          = "color14"
    gold           = "color15"
    brown          = "color16"
    olive          = "color17"
    maroon         = "color19"
    red_orange     = "color20"
    yellow_orange  = "color21"
    forest_green   = "color22"
    turquoise_blue = "color23"
    azure_blue     = "color24"
    cerulean_blue  = "color25"
    midnight_blue  = "color26"
    medium_blue    = "color27"
    cobalt_blue    = "color28"
    violet_blue    = "color29"
    blue_violet    = "color30"
    medium_violet  = "color31"
    medium_rose    = "color32"
    lavender       = "color33"
    orchid         = "color34"
    thistle        = "color35"
    peach          = "color36"
    salmon         = "color37"
    magenta        = "color38"
    red_violet     = "color39"
    mahogany       = "color40"
    burnt_sienna   = "color41"
    chestnut       = "color42"
  }
  type = map(string)
}