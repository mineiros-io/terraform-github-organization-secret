# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT CALCULATED VARIABLES (prefer full objects)
# ----------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT ALL RESOURCES AS FULL OBJECTS
# ----------------------------------------------------------------------------------------------------------------------

output "secret" {
  description = "All attributes of the created `github_actions_organization_secret` resource."
  value       = try(github_actions_organization_secret.secret[0], null)
}

output "repositories" {
  description = "All attributes of the created `github_actions_organization_secret_repositories` resource."
  value       = try(github_actions_organization_secret_repositories.repositories, null)
}

# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT ALL INPUT VARIABLES
# ----------------------------------------------------------------------------------------------------------------------

output "module_inputs" {
  description = "A map of all module arguments. Omitted optional arguments will be represented with their actual defaults."
  value       = {}
}

# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT MODULE CONFIGURATION
# ----------------------------------------------------------------------------------------------------------------------

output "module_enabled" {
  description = "Whether the module is enabled."
  value       = var.module_enabled
}

# output "module_defaults" {
#   description = "Default settings that overwrite the module and resource defaults in this module."
#   value       = var.module_defaults
# }

output "module_tags" {
  description = "A map of tags that will be applied to all created resources that accept tags."
  value       = var.module_tags
}
