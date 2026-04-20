# Examples

This directory contains examples for the hcloud-labels module.

## Examples

| Example | Description |
|---------|-------------|
| [basic](./basic) | Minimal configuration |
| [complete](./complete) | Full configuration with all options |
| [terragrunt](./terragrunt) | Terragrunt wrapper example |

## Usage

```bash
cd _example/basic  # or complete/terragrunt

export HCLOUD_TOKEN="your-api-token"

terraform init
terraform plan
terraform apply
```
