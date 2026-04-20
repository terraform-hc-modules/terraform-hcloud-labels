# Wrapper for the root module

The configuration in this directory contains an implementation of a single module wrapper pattern, which allows managing several copies of a module in places where using the native Terraform `for_each` feature is not feasible (e.g., with Terragrunt).

This wrapper does not implement any extra functionality; it simply helps create many instances of the root module using:

- `defaults`: default values applied to all items
- `items`: per-item overrides

Important: since Terraform/OpenTofu cannot pass arbitrary maps as module arguments, you must keep `wrappers/main.tf` in sync with the root module inputs (add pass-through mappings as new variables are introduced).

## Usage with Terragrunt

`terragrunt.hcl`:

```hcl
terraform {
  source = "terraform-hc-modules/labels/hcloud//wrappers"
}

inputs = {
  defaults = {
    labels = {
      managed_by = "terragrunt"
    }
  }

  items = {
    a = {
      # module inputs for instance "a"
    }
    b = {
      # module inputs for instance "b"
    }
  }
}
```

## Usage with Terraform / OpenTofu

```hcl
module "wrapper" {
  source = "../wrappers"

  defaults = {
    labels = {
      managed_by = "terraform"
    }
  }

  items = {
    a = {}
    b = {}
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.49.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_wrapper"></a> [wrapper](#module\_wrapper) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_items"></a> [items](#input\_items) | Map of items to create labels for | `any` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_wrapper"></a> [wrapper](#output\_wrapper) | Map of wrapper module instances. |
<!-- END_TF_DOCS -->