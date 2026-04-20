# Terraform Module Template (Hetzner `hcloud`)

This repository is a **GitHub template** used to create per-module repositories for the [Terraform Registry](https://registry.terraform.io/) under the GitHub organization [`terraform-hc-modules`](https://github.com/terraform-hc-modules).

## Provider

All modules created from this template target the Hetzner Cloud provider:

- **Provider**: [`hetznercloud/hcloud`](https://registry.terraform.io/providers/hetznercloud/hcloud/latest)

## How to Use This Template

### Option 1: GitHub Template (Recommended)

1. Click "Use this template" on GitHub
2. Name your repository `terraform-hcloud-<resource>` (e.g., `terraform-hcloud-server`)
3. Clone and replace placeholders

### Option 2: Script Generation

```bash
python3 scripts/new_module_repo.py \
  --module-name "hcloud-server" \
  --registry-name "server" \
  --description "Manage Hetzner Cloud servers with opinionated defaults."
```

## Placeholders

Files contain these placeholders that must be replaced:

| Placeholder | Description | Example |
|-------------|-------------|---------|
| `{{MODULE_NAME}}` | Human-readable module name | `hcloud-server` |
| `{{MODULE_REGISTRY_NAME}}` | Registry module name (repo suffix) | `server` |
| `{{MODULE_DESCRIPTION}}` | One-line module description | `Manage Hetzner Cloud servers.` |

## Template Structure

```
terraform-module-template/
├── main.tf              # Primary resources
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── terraform.tf         # Version constraints
├── README.module.md     # Template for generated README.md
├── wrappers/            # Terragrunt wrapper module
├── examples/
│   ├── basic/           # Basic usage example
│   └── terragrunt/      # Terragrunt example
├── .github/workflows/
│   ├── ci.yml           # CI pipeline (lint, validate, security)
│   └── release.yml      # GitHub Release automation
├── .tfsec/              # tfsec configuration
├── .checkov.yml         # Checkov configuration
├── .gitleaks.toml       # Gitleaks secret scanning
├── .tflint.hcl          # TFLint configuration
└── Makefile             # Development commands
```

## CI/CD Features

The template includes comprehensive CI/CD:

- **Terraform**: Format check, init, validate
- **OpenTofu**: Full compatibility testing
- **Terragrunt**: Wrapper validation
- **Security**: gitleaks, tfsec, checkov
- **Linting**: TFLint with recommended preset
- **Documentation**: terraform-docs auto-generation

## License

[MPL-2.0](LICENSE)
