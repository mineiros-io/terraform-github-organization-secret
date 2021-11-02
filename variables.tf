# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables must be set when using this module.
# ----------------------------------------------------------------------------------------------------------------------

variable "secret_name" {
  description = "(Required) Name of the secret."
  type        = string
}

variable "visibility" {
  description = "(Required) Configures the access that repositories have to the organization secret. Must be one of all, private, selected. selected_repository_ids is required if set to selected."
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These variables have defaults, but may be overridden.
# ----------------------------------------------------------------------------------------------------------------------

variable "skip_secret_creation" {
  description = "(Optional) Set to false to skip creation of the secret resource."
  type        = bool
  default     = false
}
variable "encrypted_value" {
  description = "(Optional) Encrypted value of the secret using the Github public key in Base64 format."
  type        = string
  default     = null
}

variable "plaintext_value" {
  description = "(Optional) Plaintext value of the secret to be encrypted."
  type        = string
  default     = null
}

variable "selected_repository_ids" {
  description = "(Optional) An array of repository ids that can access the organization secret."
  type        = set(string)
  default     = null
}

# ----------------------------------------------------------------------------------------------------------------------
# MODULE CONFIGURATION PARAMETERS
# These variables are used to configure the module.
# ----------------------------------------------------------------------------------------------------------------------

variable "module_enabled" {
  type        = bool
  description = "(Optional) Whether to create resources within the module or not."
  default     = true
}

variable "module_tags" {
  type        = map(string)
  description = "(Optional) A map of tags that will be applied to all created resources that accept tags. Tags defined with 'module_tags' can be overwritten by resource-specific tags."
  default     = {}
}

variable "module_depends_on" {
  type        = any
  description = "(Optional) A list of external resources the module depends_on."
  default     = []
}
