header {
  image = "https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg"
  url   = "https://mineiros.io/?ref=terraform-github-organization-secret"

  badge "build" {
    image = "https://github.com/mineiros-io/terraform-github-organization-secret/workflows/Tests/badge.svg"
    url   = "https://github.com/mineiros-io/terraform-github-organization-secret/actions"
    text  = "Build Status"
  }

  badge "semver" {
    image = "https://img.shields.io/github/v/tag/mineiros-io/terraform-github-organization-secret.svg?label=latest&sort=semver"
    url   = "https://github.com/mineiros-io/terraform-github-organization-secret/releases"
    text  = "GitHub tag (latest SemVer)"
  }

  badge "terraform" {
    image = "https://img.shields.io/badge/Terraform-1.x-623CE4.svg?logo=terraform"
    url   = "https://github.com/hashicorp/terraform/releases"
    text  = "Terraform Version"
  }

  badge "tf-gh" {
    image = "https://img.shields.io/badge/GH-4-F8991D.svg?logo=terraform"
    url   = "https://github.com/terraform-providers/terraform-provider-github/releases"
    text  = "Github Provider Version"
  }

  badge "slack" {
    image = "https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack"
    url   = "https://mineiros.io/slack"
    text  = "Join Slack"
  }
}

section {
  title   = "terraform-github-organization-secret"
  toc     = true
  content = <<-END
    A [Terraform] module for creating and managing
    [Github Actions secrets](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_secret)
    on [Github](https://github.com/).

    **_This module supports Terraform version 1
    and is compatible with the Terraform Github Provider version 4._**

    This module is part of our Infrastructure as Code (IaC) framework
    that enables our users and customers to easily deploy and manage reusable,
    secure, and production-grade cloud infrastructure.
  END

  section {
    title   = "Module Features"
    content = <<-END
      This module implements the following Terraform resources

      - `github_actions_organization_secret`
      - `github_actions_organization_secret_repositories`
    END
  }

  section {
    title   = "Getting Started"
    content = <<-END
      Most common usage of the module:

      ```hcl
      module "terraform-github-organization-secret" {
        source = "git@github.com:mineiros-io/terraform-github-organization-secret.git?ref=v0.0.1"

        secret_name = "name"
      }
      ```
    END
  }

  section {
    title   = "Module Argument Reference"
    content = <<-END
      See [variables.tf] and [examples/] for details and use-cases.
    END

    section {
      title = "Main Resource Configuration"

      variable "secret_name" {
        required    = true
        type        = string
        description = <<-END
          Name of the secret.
        END
      }

      variable "skip_secret_creation" {
        type        = bool
        description = <<-END
          Define whether to create the secret resource or not. Defaults to creating the secret resource if either `plaintext_value` or `encrypted_value` is set.
        END
      }

      variable "visibility" {
        type        = string
        default     = "selected"
        description = <<-END
          Configures the access that repositories have to the organization
          secret. Must be one of all, private, selected.
        END
      }

      variable "encrypted_value" {
        type        = string
        description = <<-END
          Encrypted value of the secret using the Github public key in
          Base64 format.
        END
      }

      variable "plaintext_value" {
        type        = string
        description = <<-END
          Plaintext value of the secret to be encrypted.
        END
      }

      variable "selected_repository_ids" {
        type        = set(string)
        default     = []
        description = <<-END
          An array of repository ids that can access the organization secret.
          Required visibility to be set to `selected`
        END
      }
    }

    section {
      title = "Module Configuration"

      variable "module_enabled" {
        type        = bool
        default     = true
        description = <<-END
          Specifies whether resources in the module will be created.
        END
      }

      variable "module_depends_on" {
        type           = list(dependency)
        description    = <<-END
          A list of dependencies.
          Any object can be _assigned_ to this list to define a hidden external dependency.
        END
        default        = []
        readme_example = <<-END
          module_depends_on = [
            null_resource.name
          ]
        END
      }
    }
  }

  section {
    title   = "Module Outputs"
    content = <<-END
      The following attributes are exported in the outputs of the module:
    END

    output "secret" {
      type        = object(secret)
      description = <<-END
        All attributes of the created `github_actions_organization_secret`
        resource.
      END
    }

    output "repositories" {
      type        = object(repositories)
      description = <<-END
        Whether this module is enabled.
      END
    }

    output "module_enabled" {
      type        = bool
      description = <<-END
        All attributes of the created
        `github_actions_organization_secret_repositories` resource.
      END
    }
  }

  section {
    title = "External Documentation"

    section {
      title   = "Terraform Github Provider Documentation"
      content = <<-END
        - https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_secret
        - https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_secret
      END
    }
  }

  section {
    title   = "Module Versioning"
    content = <<-END
      This Module follows the principles of [Semantic Versioning (SemVer)].

      Given a version number `MAJOR.MINOR.PATCH`, we increment the:

      1. `MAJOR` version when we make incompatible changes,
      2. `MINOR` version when we add functionality in a backwards compatible manner, and
      3. `PATCH` version when we make backwards compatible bug fixes.
    END

    section {
      title   = "Backwards compatibility in `0.0.z` and `0.y.z` version"
      content = <<-END
        - Backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
        - Backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)
      END
    }
  }

  section {
    title   = "About Mineiros"
    content = <<-END
      [Mineiros][homepage] is a remote-first company headquartered in Berlin, Germany
      that solves development, automation and security challenges in cloud infrastructure.

      Our vision is to massively reduce time and overhead for teams to manage and
      deploy production-grade and secure cloud infrastructure.

      We offer commercial support for all of our modules and encourage you to reach out
      if you have any questions or need help. Feel free to email us at [hello@mineiros.io] or join our
      [Community Slack channel][slack].
    END
  }

  section {
    title   = "Reporting Issues"
    content = <<-END
      We use GitHub [Issues] to track community reported issues and missing features.
    END
  }

  section {
    title   = "Contributing"
    content = <<-END
      Contributions are always encouraged and welcome! For the process of accepting changes, we use
      [Pull Requests]. If you'd like more information, please see our [Contribution Guidelines].
    END
  }

  section {
    title   = "Makefile Targets"
    content = <<-END
      This repository comes with a handy [Makefile].
      Run `make help` to see details on each available target.
    END
  }

  section {
    title   = "License"
    content = <<-END
      [![license][badge-license]][apache20]

      This module is licensed under the Apache License Version 2.0, January 2004.
      Please see [LICENSE] for full details.

      Copyright &copy; 2020-2022 [Mineiros GmbH][homepage]
    END
  }
}

references {
  ref "homepage" {
    value = "https://mineiros.io/?ref=terraform-github-organization-secret"
  }
  ref "hello@mineiros.io" {
    value = " mailto:hello@mineiros.io"
  }
  ref "badge-license" {
    value = "https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg"
  }
  ref "releases-terraform" {
    value = "https://github.com/hashicorp/terraform/releases"
  }
  ref "releases-aws-provider" {
    value = "https://github.com/terraform-providers/terraform-provider-aws/releases"
  }
  ref "apache20" {
    value = "https://opensource.org/licenses/Apache-2.0"
  }
  ref "slack" {
    value = "https://mineiros.io/slack"
  }
  ref "terraform" {
    value = "https://www.terraform.io"
  }
  ref "aws" {
    value = "https://aws.amazon.com/"
  }
  ref "semantic versioning (semver)" {
    value = "https://semver.org/"
  }
  ref "variables.tf" {
    value = "https://github.com/mineiros-io/terraform-github-organization-secret/blob/main/variables.tf"
  }
  ref "examples/" {
    value = "https://github.com/mineiros-io/terraform-github-organization-secret/blob/main/examples"
  }
  ref "issues" {
    value = "https://github.com/mineiros-io/terraform-github-organization-secret/issues"
  }
  ref "license" {
    value = "https://github.com/mineiros-io/terraform-github-organization-secret/blob/main/LICENSE"
  }
  ref "makefile" {
    value = "https://github.com/mineiros-io/terraform-github-organization-secret/blob/main/Makefile"
  }
  ref "pull requests" {
    value = "https://github.com/mineiros-io/terraform-github-organization-secret/pulls"
  }
  ref "contribution guidelines" {
    value = "https://github.com/mineiros-io/terraform-github-organization-secret/blob/main/CONTRIBUTING.md"
  }
}
