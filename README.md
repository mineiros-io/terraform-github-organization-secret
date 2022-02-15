[<img src="https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg" width="400"/>](https://mineiros.io/?ref=terraform-github-organization-secret)

[![Build Status](https://github.com/mineiros-io/terraform-github-organization-secret/workflows/Tests/badge.svg)](https://github.com/mineiros-io/terraform-github-organization-secret/actions)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/mineiros-io/terraform-github-organization-secret.svg?label=latest&sort=semver)](https://github.com/mineiros-io/terraform-github-organization-secret/releases)
[![Terraform Version](https://img.shields.io/badge/Terraform-1.x-623CE4.svg?logo=terraform)](https://github.com/hashicorp/terraform/releases)
[![Github Provider Version](https://img.shields.io/badge/GH-4-F8991D.svg?logo=terraform)](https://github.com/terraform-providers/terraform-provider-github/releases)
[![Join Slack](https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack)](https://mineiros.io/slack)

# terraform-github-organization-secret

A [Terraform] module for creating and managing
[Github Actions secrets](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_secret)
on [Github](https://github.com/).

**_This module supports Terraform version 1
and is compatible with the Terraform Github Provider version 4._**

This module is part of our Infrastructure as Code (IaC) framework
that enables our users and customers to easily deploy and manage reusable,
secure, and production-grade cloud infrastructure.


- [Module Features](#module-features)
- [Getting Started](#getting-started)
- [Module Argument Reference](#module-argument-reference)
  - [Main Resource Configuration](#main-resource-configuration)
  - [Module Configuration](#module-configuration)
- [Module Outputs](#module-outputs)
- [External Documentation](#external-documentation)
  - [Terraform Github Provider Documentation](#terraform-github-provider-documentation)
- [Module Versioning](#module-versioning)
  - [Backwards compatibility in `0.0.z` and `0.y.z` version](#backwards-compatibility-in-00z-and-0yz-version)
- [About Mineiros](#about-mineiros)
- [Reporting Issues](#reporting-issues)
- [Contributing](#contributing)
- [Makefile Targets](#makefile-targets)
- [License](#license)

## Module Features

This module implements the following Terraform resources

- `github_actions_organization_secret`
- `github_actions_organization_secret_repositories`

## Getting Started

Most common usage of the module:

```hcl
module "terraform-github-organization-secret" {
  source = "git@github.com:mineiros-io/terraform-github-organization-secret.git?ref=v0.0.1"

  secret_name = "name"
}
```

## Module Argument Reference

See [variables.tf] and [examples/] for details and use-cases.

### Main Resource Configuration

- [**`secret_name`**](#var-secret_name): *(**Required** `string`)*<a name="var-secret_name"></a>

  Name of the secret.

- [**`skip_secret_creation`**](#var-skip_secret_creation): *(Optional `bool`)*<a name="var-skip_secret_creation"></a>

  Define whether to create the secret resource or not. Defaults to creating the secret resource if either `plaintext_value` or `encrypted_value` is set.

- [**`visibility`**](#var-visibility): *(Optional `string`)*<a name="var-visibility"></a>

  Configures the access that repositories have to the organization
  secret. Must be one of all, private, selected.

  Default is `"selected"`.

- [**`encrypted_value`**](#var-encrypted_value): *(Optional `string`)*<a name="var-encrypted_value"></a>

  Encrypted value of the secret using the Github public key in
  Base64 format.

- [**`plaintext_value`**](#var-plaintext_value): *(Optional `string`)*<a name="var-plaintext_value"></a>

  Plaintext value of the secret to be encrypted.

- [**`selected_repository_ids`**](#var-selected_repository_ids): *(Optional `set(string)`)*<a name="var-selected_repository_ids"></a>

  An array of repository ids that can access the organization secret.
  Required visibility to be set to `selected`

  Default is `[]`.

### Module Configuration

- [**`module_enabled`**](#var-module_enabled): *(Optional `bool`)*<a name="var-module_enabled"></a>

  Specifies whether resources in the module will be created.

  Default is `true`.

- [**`module_depends_on`**](#var-module_depends_on): *(Optional `list(dependency)`)*<a name="var-module_depends_on"></a>

  A list of dependencies.
  Any object can be _assigned_ to this list to define a hidden external dependency.

  Default is `[]`.

  Example:

  ```hcl
  module_depends_on = [
    null_resource.name
  ]
  ```

## Module Outputs

The following attributes are exported in the outputs of the module:

- [**`secret`**](#output-secret): *(`object(secret)`)*<a name="output-secret"></a>

  All attributes of the created `github_actions_organization_secret`
  resource.

- [**`repositories`**](#output-repositories): *(`object(repositories)`)*<a name="output-repositories"></a>

  Whether this module is enabled.

- [**`module_enabled`**](#output-module_enabled): *(`bool`)*<a name="output-module_enabled"></a>

  All attributes of the created
  `github_actions_organization_secret_repositories` resource.

## External Documentation

### Terraform Github Provider Documentation

- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_organization_secret
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_secret

## Module Versioning

This Module follows the principles of [Semantic Versioning (SemVer)].

Given a version number `MAJOR.MINOR.PATCH`, we increment the:

1. `MAJOR` version when we make incompatible changes,
2. `MINOR` version when we add functionality in a backwards compatible manner, and
3. `PATCH` version when we make backwards compatible bug fixes.

### Backwards compatibility in `0.0.z` and `0.y.z` version

- Backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
- Backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)

## About Mineiros

[Mineiros][homepage] is a remote-first company headquartered in Berlin, Germany
that solves development, automation and security challenges in cloud infrastructure.

Our vision is to massively reduce time and overhead for teams to manage and
deploy production-grade and secure cloud infrastructure.

We offer commercial support for all of our modules and encourage you to reach out
if you have any questions or need help. Feel free to email us at [hello@mineiros.io] or join our
[Community Slack channel][slack].

## Reporting Issues

We use GitHub [Issues] to track community reported issues and missing features.

## Contributing

Contributions are always encouraged and welcome! For the process of accepting changes, we use
[Pull Requests]. If you'd like more information, please see our [Contribution Guidelines].

## Makefile Targets

This repository comes with a handy [Makefile].
Run `make help` to see details on each available target.

## License

[![license][badge-license]][apache20]

This module is licensed under the Apache License Version 2.0, January 2004.
Please see [LICENSE] for full details.

Copyright &copy; 2020-2022 [Mineiros GmbH][homepage]


<!-- References -->

[homepage]: https://mineiros.io/?ref=terraform-github-organization-secret
[hello@mineiros.io]: mailto:hello@mineiros.io
[badge-license]: https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg
[releases-terraform]: https://github.com/hashicorp/terraform/releases
[releases-aws-provider]: https://github.com/terraform-providers/terraform-provider-aws/releases
[apache20]: https://opensource.org/licenses/Apache-2.0
[slack]: https://mineiros.io/slack
[terraform]: https://www.terraform.io
[aws]: https://aws.amazon.com/
[semantic versioning (semver)]: https://semver.org/
[variables.tf]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/main/variables.tf
[examples/]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/main/examples
[issues]: https://github.com/mineiros-io/terraform-github-organization-secret/issues
[license]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/main/LICENSE
[makefile]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/main/Makefile
[pull requests]: https://github.com/mineiros-io/terraform-github-organization-secret/pulls
[contribution guidelines]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/main/CONTRIBUTING.md
