.PHONY: fmt validate docs ci tofu-fmt tofu-validate terragrunt-validate security tflint

fmt:
	terraform fmt -recursive

validate:
	terraform init -backend=false
	terraform validate

tofu-fmt:
	tofu fmt -recursive

tofu-validate:
	tofu init -backend=false
	tofu validate

terragrunt-validate:
	cd examples/terragrunt/basic && terragrunt validate

tflint:
	@command -v tflint >/dev/null 2>&1 || (echo "tflint is required"; exit 1)
	tflint --init
	tflint -f compact

security:
	@command -v gitleaks >/dev/null 2>&1 || (echo "gitleaks is required"; exit 1)
	@command -v tfsec >/dev/null 2>&1 || (echo "tfsec is required"; exit 1)
	@command -v checkov >/dev/null 2>&1 || (echo "checkov is required"; exit 1)
	gitleaks detect --source . --verbose
	tfsec . --exclude-downloaded-modules
	checkov -d . --compact

docs:
	@command -v terraform-docs >/dev/null 2>&1 || (echo "terraform-docs is required. Install from https://terraform-docs.io/"; exit 1)
	terraform-docs markdown table --output-file README.md --output-mode inject .

ci: fmt validate

