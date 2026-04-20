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
  source = "terraform-hc-modules/{{MODULE_REGISTRY_NAME}}/hcloud//wrappers"
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

