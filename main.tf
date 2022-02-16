locals {
  skip_secret_creation_default = var.plaintext_value == null && var.encrypted_value == null

  skip_secret_creation = var.skip_secret_creation == null ? local.skip_secret_creation_default : var.skip_secret_creation
}

resource "github_actions_organization_secret" "secret" {
  count = var.module_enabled && !local.skip_secret_creation ? 1 : 0

  depends_on = [var.module_depends_on]

  secret_name = var.secret_name

  visibility              = var.visibility
  selected_repository_ids = var.selected_repository_ids

  plaintext_value = var.plaintext_value
  encrypted_value = var.encrypted_value
}

resource "github_actions_organization_secret_repositories" "repositories" {
  count = var.module_enabled && local.skip_secret_creation && length(var.selected_repository_ids) > 0 ? 1 : 0

  depends_on = [var.module_depends_on]

  secret_name = var.secret_name

  selected_repository_ids = var.selected_repository_ids
}
