# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COMPLETE FEATURES UNIT TEST
# This module tests a complete set of most/all non-exclusive features
# The purpose is to activate everything the module offers, but trying to keep execution time and costs minimal.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.10"
    }
  }
}

provider "github" {}

# DO NOT RENAME MODULE NAME
module "test" {
  source = "../.."

  module_enabled = true

  # add all required arguments

  secret_name = "example_secret_name_complete"
  visibility  = "private"

  # add all optional arguments that create additional resources

  plaintext_value         = "plain-test"
  selected_repository_ids = ["mineiros-io/terraform-github-repository"]

  # add most/all other optional arguments

  module_depends_on = ["nothing"]
}

# outputs generate non-idempotent terraform plans so we disable them for now unless we need them.
# output "all" {
#   description = "All outputs of the module."
#   value       = module.test
# }
