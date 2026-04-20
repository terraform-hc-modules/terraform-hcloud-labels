terraform {
  source = "../.."

  extra_arguments "no_backend" {
    commands  = ["init"]
    arguments = ["-backend=false"]
  }
}

inputs = {
  labels = {
    managed_by = "terragrunt"
  }
}

