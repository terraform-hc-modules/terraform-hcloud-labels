# Hetzner Cloud Labels Module

[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.0-blueviolet)](https://www.terraform.io/)
[![License: MPL-2.0](https://img.shields.io/badge/License-MPL--2.0-blue.svg)](https://opensource.org/licenses/MPL-2.0)
[![CI](https://github.com/terraform-hc-modules/terraform-hcloud-labels/actions/workflows/ci.yml/badge.svg)](https://github.com/terraform-hc-modules/terraform-hcloud-labels/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/terraform-hc-modules/terraform-hcloud-labels)](https://github.com/terraform-hc-modules/terraform-hcloud-labels/releases)


Terraform module to generate consistent naming and labeling for Hetzner Cloud resources.

## Usage

```hcl
module "labels" {
  source  = "terraform-hc-modules/labels/hcloud"
  version = "~> 0.1"

  name        = "web-server"
  environment = "production"
  project     = "myapp"
  owner       = "platform-team"
}

# Use outputs
resource "hcloud_server" "this" {
  name        = module.labels.id      # "production-web-server"
  server_type = "cx22"
  image       = "ubuntu-24.04"
  labels      = module.labels.labels  # { name = "web-server", environment = "production", ... }
}
```

## Examples

- [Basic](examples/basic) - Simple usage
- [Complete](examples/complete) - All features

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter between labels in the generated ID. | `string` | `"-"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (e.g., dev, staging, prod). | `string` | `""` | no |
| <a name="input_extra_labels"></a> [extra\_labels](#input\_extra\_labels) | Additional labels to merge with generated labels. | `map(string)` | `{}` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Order of labels to include in the generated ID. | `list(string)` | <pre>[<br/>  "environment",<br/>  "name"<br/>]</pre> | no |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | Tool managing this resource. | `string` | `"terraform"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource. | `string` | `""` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner of the resource (team or individual). | `string` | `""` | no |
| <a name="input_project"></a> [project](#input\_project) | Project or application name. | `string` | `""` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | Whether the module is enabled. |
| <a name="output_environment"></a> [environment](#output\_environment) | The environment input. |
| <a name="output_id"></a> [id](#output\_id) | Generated ID based on label\_order. |
| <a name="output_labels"></a> [labels](#output\_labels) | Map of labels for use with hcloud resources. |
| <a name="output_labels_as_list"></a> [labels\_as\_list](#output\_labels\_as\_list) | Labels as a list of key-value objects. |
| <a name="output_managed_by"></a> [managed\_by](#output\_managed\_by) | The managed\_by input. |
| <a name="output_name"></a> [name](#output\_name) | The name input. |
| <a name="output_owner"></a> [owner](#output\_owner) | The owner input. |
| <a name="output_project"></a> [project](#output\_project) | The project input. |
<!-- END_TF_DOCS -->

## License

Mozilla Public License 2.0 - see [LICENSE](LICENSE)
