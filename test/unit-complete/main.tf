# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COMPLETE FEATURES UNIT TEST
# This module tests a complete set of most/all non-exclusive features
# The purpose is to activate everything the module offers, but trying to keep execution time and costs minimal.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.16"
    }
  }
}

provider "github" {}

module "repository" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.10.0"

  name = "test-complete-terraform-github-organization-secret"

  archive_on_destroy = false

  license_template   = "apache-2.0"
  gitignore_template = "Terraform"
}

# DO NOT RENAME MODULE NAME
module "test" {
  source = "../.."

  module_enabled = true

  # add all required arguments

  secret_name = "example_secret_name_complete"
  visibility  = "selected"

  # add all optional arguments that create additional resources

  plaintext_value         = "plain-test"
  selected_repository_ids = [module.repository.repository.repo_id]

  # add most/all other optional arguments

  module_depends_on = ["nothing"]
}
