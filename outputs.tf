# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT CALCULATED VARIABLES (prefer full objects)
# ----------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT ALL RESOURCES AS FULL OBJECTS
# ----------------------------------------------------------------------------------------------------------------------

output "secret" {
  description = "All attributes of the created `github_actions_organization_secret` resource."
  value       = one(github_actions_organization_secret.secret)
}

output "repositories" {
  description = "All attributes of the created `github_actions_organization_secret_repositories` resource."
  value       = one(github_actions_organization_secret.secret)
}

# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT ALL INPUT VARIABLES
# ----------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT MODULE CONFIGURATION
# ----------------------------------------------------------------------------------------------------------------------

output "module_enabled" {
  description = "Whether the module is enabled."
  value       = var.module_enabled
}
