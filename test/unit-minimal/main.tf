# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# MINIMAL FEATURES UNIT TEST
# This module tests a minimal set of features.
# The purpose is to test all defaults for optional arguments and just provide the required arguments.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_providers {
    github = {
      source = "integrations/github"
      # always test with exact version to catch unsupported blocks/arguments early
      # this should match the minimal version in versions.tf
      version = "4.16"
    }
  }
}

provider "github" {}

# DO NOT RENAME MODULE NAME
module "test" {
  source = "../.."

  # add only required arguments and no optional arguments

  secret_name = "example_secret_name_minimal"
}

module "test-nosecret" {
  source = "../.."

  secret_name = "some_existing_secret"

  skip_secret_creation = true
}

# outputs generate non-idempotent terraform plans so we disable them for now unless we need them.
# output "all" {
#   description = "All outputs of the module."
#   value       = module.test
# }
