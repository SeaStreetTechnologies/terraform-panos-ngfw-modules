variable "mode" {
  description = "The mode to use for the modules. Valid values are `panorama` and `ngfw`."
  type        = string
  validation {
    condition     = contains(["panorama", "ngfw"], var.mode)
    error_message = "The mode must be either `panorama` or `ngfw`."
  }
}

variable "templates" {
  description = <<-EOF
  Map of the templates, where key is the template's name:
  - `description` - (Optional) The template's description.

  Example:
  ```
  {
    "test-template" = {
      description = "My test template"
    }
  }
  ```
  EOF
  default     = {}
  type = map(object({
    description = optional(string)
  }))
}
