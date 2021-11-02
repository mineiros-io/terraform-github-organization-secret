resource "github_actions_organization_secret" "secret" {
  count = var.module_enabled && var.skip_secret_creation == false ? 1 : 0

  depends_on = [var.module_depends_on]

  secret_name     = var.secret_name
  encrypted_value = var.encrypted_value
  plaintext_value = var.plaintext_value
  visibility      = var.visibility
}

resource "github_actions_organization_secret_repositories" "repositories" {
  count = var.module_enabled && var.repositories != null ? var.repositories : tomap({})

  depends_on = [var.module_depends_on]

  secret_name             = var.skip_secret_creation ? var.secret_name : github_actions_organization_secret.secret[0].secret_name
  selected_repository_ids = var.selected_repository_ids
}
