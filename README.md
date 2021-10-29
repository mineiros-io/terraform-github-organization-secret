[<img src="https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg" width="400"/>][homepage]

[![Build Status][badge-build]][build-status]
[![GitHub tag (latest SemVer)][badge-semver]][releases-github]
[![Terraform Version][badge-terraform]][releases-terraform]
[![Github Provider Version][badge-tf-gh]][releases-github-provider]
[![Join Slack][badge-slack]][slack]

# terraform-github-organization-secret

A [Terraform] module that acts as a wrapper around the Terraform
[GitHub provider](https://www.terraform.io/docs/providers/github/index.html) and offers a more convenient and tested way
to manage GitHub Organizations following best practices.

**_This module supports Terraform v1.x and is compatible with the Official Terraform GitHub Provider v4.x from `integrations/github`._**

**Attention: This module is incompatible with the Hashicorp GitHub Provider! The latest version of this module supporting `hashicorp/github` provider is `~> 0.6.0`**

- [Module Features](#module-features)
- [Getting Started](#getting-started)
- [Module Argument Reference](#module-argument-reference)
  - [Top-level Arguments](#top-level-arguments)
    - [Module Configuration](#module-configuration)
    - [Main Resource Configuration](#main-resource-configuration)
    - [Extended Resource Configuration](#extended-resource-configuration)
- [Module Attributes Reference](#module-attributes-reference)
- [External Documentation](#external-documentation)
- [Module Versioning](#module-versioning)
  - [Backwards compatibility in `0.0.z` and `0.y.z` version](#backwards-compatibility-in-00z-and-0yz-version)
- [About Mineiros](#about-mineiros)
- [Reporting Issues](#reporting-issues)
- [Contributing](#contributing)
- [Makefile Targets](#makefile-targets)
- [License](#license)

## Module Features

In contrast to the plain `terraform_resource` resource this module has better features.
While all security features can be disabled as needed best practices
are pre-configured.

<!--
These are some of our custom features:

- **Default Security Settings**:
  secure by default by setting security to `true`, additional security can be added by setting some feature to `enabled`

- **Standard Module Features**:
  Cool Feature of the main resource, tags

- **Extended Module Features**:
  Awesome Extended Feature of an additional related resource,
  and another Cool Feature

- **Additional Features**:
  a Cool Feature that is not actually a resource but a cool set up from us

- _Features not yet implemented_:
  Standard Features missing,
  Extended Features planned,
  Additional Features planned
-->

## Getting Started

Most basic usage just setting required arguments:

```hcl
module "terraform-github-organization-secret" {
  source = "git@github.com:mineiros-io/terraform-github-organization-secret.git?ref=v0.0.1"
}
```

## Module Argument Reference

See [variables.tf] and [examples/] for details and use-cases.

### Top-level Arguments

#### Module Configuration

- **`module_enabled`**: _(Optional `bool`)_

  Specifies whether resources in the module will be created.
  Default is `true`.

- **`module_tags`**: _(Optional `map(string)`)_

  A map of tags that will be applied to all created resources that accept tags. Tags defined with 'module_tags' can be
  overwritten by resource-specific tags.
  Default is `{}`.

  Example:
  ```hcl
  module_tags = {
    environment = "staging"
    team        = "platform"
  }
  ```

- **`module_depends_on`**: _(Optional `list(dependencies)`)_

  A list of dependencies. Any object can be _assigned_ to this list to define a hidden external dependency.

  Example:
  ```hcl
  module_depends_on = [
    aws_vpc.vpc
  ]
  ```

#### Main Resource Configuration

<!-- Example of a required variable:

- **`name`**: **_(Required `string`)_**

  The name of the resource.
  Default is `true`.

-->

<!-- Example of an optional variable:

- **`name`**: _(Optional `string`)_

  The name of the resource.
  Default is `true`.

-->

<!-- Example of an object:
     - We use inline documentation to describe complex objects or lists/maps of complex objects.
     - Please indent each level with 2 spaces so the documentation is rendered in a readable way.

- **`user`**: _(Optional `object(user)`)_

  A user object.
  Default is `true`.

  A/Each `user` object can have the following fields:

  - **`name`**: **_(Required `string`)_**

    The Name of the user.

  - **`description`**: _(Optional `decription`)_

    A description describing the user in more detail.
    Default is "".

  Example
  ```hcl
  user = {
    name        = "marius"
    description = "The guy from Berlin."
  }
  ```
-->



#### Extended Resource Configuration

## Module Attributes Reference

The following attributes are exported in the outputs of the module:

- **`module_enabled`**

  Whether this module is enabled.

- **`module_tags`**

  The map of tags that are being applied to all created resources that accept tags.

## External Documentation

- Terraform Github Provider Documentation:
  - https://www.terraform.io/docs/providers/github/index.html

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

Mineiros is a [DevOps as a Service][homepage] company based in Berlin, Germany.
We offer commercial support for all of our projects and encourage you to reach out
if you have any questions or need help. Feel free to send us an email at [hello@mineiros.io] or join our [Community Slack channel][slack].

We can also help you with:

- Terraform modules for all types of infrastructure such as VPCs, Docker clusters, databases, logging and monitoring, CI, etc.
- Consulting & training on AWS, Terraform and DevOps

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

Copyright &copy; 2021 [Mineiros GmbH][homepage]

<!-- References -->

[homepage]: https://mineiros.io/?ref=terraform-github-organization-secret
[hello@mineiros.io]: mailto:hello@mineiros.io
[badge-semver]: https://img.shields.io/github/v/tag/mineiros-io/terraform-github-organization-secret.svg?label=latest&sort=semver
[badge-license]: https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg
[badge-terraform]: https://img.shields.io/badge/terraform-1.x-623CE4.svg?logo=terraform
[badge-slack]: https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack
[badge-tf-gh]: https://img.shields.io/badge/GH-4.x-F8991D.svg?logo=terraform
[releases-github-provider]: https://github.com/terraform-providers/terraform-provider-github/releases
[releases-terraform]: https://github.com/hashicorp/terraform/releases
[apache20]: https://opensource.org/licenses/Apache-2.0
[slack]: https://join.slack.com/t/mineiros-community/shared_invite/zt-ehidestg-aLGoIENLVs6tvwJ11w9WGg
[terraform]: https://www.terraform.io
[aws]: https://aws.amazon.com/
[semantic versioning (semver)]: https://semver.org/


<!-- markdown-link-check-disable -->

[badge-build]: https://github.com/mineiros-io/terraform-github-organization-secret/workflows/CI/CD%20Pipeline/badge.svg
[build-status]: https://github.com/mineiros-io/terraform-github-organization-secret/actions
[releases-github]: https://github.com/mineiros-io/terraform-github-organization-secret/releases
[examples/example/main.tf]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/master/examples/example/main.tf
[variables.tf]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/master/variables.tf
[examples/]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/master/examples
[issues]: https://github.com/mineiros-io/terraform-github-organization-secret/issues
[license]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/master/LICENSE
[makefile]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/master/Makefile
[pull requests]: https://github.com/mineiros-io/terraform-github-organization-secret/pulls
[contribution guidelines]: https://github.com/mineiros-io/terraform-github-organization-secret/blob/master/CONTRIBUTING.md

<!-- markdown-link-check-enable -->
