# Terraform Module: {{MODULE_NAME}}

{{MODULE_DESCRIPTION}}

[![CI](https://github.com/terraform-hc-modules/terraform-hcloud-{{MODULE_REGISTRY_NAME}}/actions/workflows/ci.yml/badge.svg)](https://github.com/terraform-hc-modules/terraform-hcloud-{{MODULE_REGISTRY_NAME}}/actions/workflows/ci.yml)
[![License: MPL-2.0](https://img.shields.io/badge/License-MPL--2.0-blue.svg)](https://opensource.org/licenses/MPL-2.0)

## Usage

```hcl
module "{{MODULE_NAME}}" {
  source  = "terraform-hc-modules/{{MODULE_REGISTRY_NAME}}/hcloud"
  version = "~> 0.1"

  name = "my-resource"

  labels = {
    environment = "production"
    managed_by  = "terraform"
  }
}
```

## Requirements

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## Tooling Compatibility

| Tool | Status |
|------|--------|
| Terraform | ✅ Supported |
| OpenTofu | ✅ Supported |
| Terragrunt | ✅ Supported |

## Examples

- [Basic](./examples/basic) - Minimal configuration example
- [Terragrunt](./examples/terragrunt/basic) - Terragrunt wrapper example

## Contributing

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) and submit pull requests to the `main` branch.

## License

This module is licensed under the [MPL-2.0 License](LICENSE).

