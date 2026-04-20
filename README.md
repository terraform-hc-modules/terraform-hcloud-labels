# Terraform Module: hcloud-labels

Terraform module for consistent labeling and naming conventions in Hetzner Cloud.

[![CI](https://github.com/terraform-hc-modules/terraform-hcloud-labels/actions/workflows/ci.yml/badge.svg)](https://github.com/terraform-hc-modules/terraform-hcloud-labels/actions/workflows/ci.yml)
[![License: MPL-2.0](https://img.shields.io/badge/License-MPL--2.0-blue.svg)](https://opensource.org/licenses/MPL-2.0)

## Usage

### Basic

```hcl
module "labels" {
  source  = "terraform-hc-modules/labels/hcloud"
  version = "~> 0.1"

  name        = "web-server"
  environment = "production"
}

resource "hcloud_server" "example" {
  name        = module.labels.id          # "production-web-server"
  server_type = "cx22"
  image       = "ubuntu-24.04"
  labels      = module.labels.labels      # {name="web-server", environment="production", managed_by="terraform"}
}
```

### Complete

```hcl
module "labels" {
  source  = "terraform-hc-modules/labels/hcloud"
  version = "~> 0.1"

  name        = "api"
  environment = "production"
  project     = "ecommerce"
  owner       = "platform-team"

  label_order = ["project", "environment", "name"]
  delimiter   = "-"

  extra_labels = {
    "cost_center" = "engineering"
    "compliance"  = "soc2"
  }
}

# Output: module.labels.id = "ecommerce-production-api"
```

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
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter between labels in the generated name. | `string` | `"-"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (e.g., dev, staging, prod). | `string` | `""` | no |
| <a name="input_extra_labels"></a> [extra\_labels](#input\_extra\_labels) | Additional labels to merge with generated labels. | `map(string)` | `{}` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Order of labels to include in the name. Set to empty list to disable. | `list(string)` | <pre>["environment", "name"]</pre> | no |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | Tool managing this resource. | `string` | `"terraform"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the application or resource. | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner of the resource (team or individual). | `string` | `""` | no |
| <a name="input_project"></a> [project](#input\_project) | Project or application name. | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | Whether the module is enabled. |
| <a name="output_environment"></a> [environment](#output\_environment) | The environment variable value. |
| <a name="output_id"></a> [id](#output\_id) | Generated ID/name based on label\_order and delimiter. |
| <a name="output_labels"></a> [labels](#output\_labels) | Map of labels to apply to resources. |
| <a name="output_labels_as_list"></a> [labels\_as\_list](#output\_labels\_as\_list) | Labels formatted as a list of key=value strings. |
| <a name="output_name"></a> [name](#output\_name) | The name variable value. |
| <a name="output_project"></a> [project](#output\_project) | The project variable value. |
<!-- END_TF_DOCS -->

## Tooling Compatibility

| Tool | Status |
|------|--------|
| Terraform | ✅ Supported |
| OpenTofu | ✅ Supported |
| Terragrunt | ✅ Supported |

## Examples

- [Basic](./_example/basic) - Minimal configuration
- [Complete](./_example/complete) - Full configuration with all options
- [Terragrunt](./_example/terragrunt) - Terragrunt wrapper example

## Contributing

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) and submit pull requests to the `main` branch.

## License

This module is licensed under the [MPL-2.0 License](LICENSE).
