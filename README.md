# Terraform Module: hcloud-labels

Terraform module for consistent labeling and naming conventions in Hetzner Cloud

[![CI](https://github.com/terraform-hc-modules/terraform-hcloud-labels/actions/workflows/ci.yml/badge.svg)](https://github.com/terraform-hc-modules/terraform-hcloud-labels/actions/workflows/ci.yml)
[![License: MPL-2.0](https://img.shields.io/badge/License-MPL--2.0-blue.svg)](https://opensource.org/licenses/MPL-2.0)

## Usage

```hcl
module "hcloud-labels" {
  source  = "terraform-hc-modules/labels/hcloud"
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
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.49.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of labels to apply to all supported resources. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name prefix for all resources created by this module. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_labels"></a> [labels](#output\_labels) | The labels applied to resources created by this module. |
| <a name="output_name"></a> [name](#output\_name) | The name prefix used for resources created by this module. |
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

