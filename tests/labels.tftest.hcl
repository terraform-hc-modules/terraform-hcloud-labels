run "id_and_labels_happy_path" {
  command = plan

  variables {
    enabled     = true
    name        = "Web-Server"
    environment = "Production"
    project     = "myapp"
    owner       = "platform-team"
    managed_by  = "terraform"

    delimiter   = "-"
    label_order = ["environment", "name"]

    extra_labels = {
      component = "compute"
    }
  }

  assert {
    condition     = output.enabled == true
    error_message = "expected enabled=true"
  }

  assert {
    condition     = output.id_parts == ["Production", "Web-Server"]
    error_message = "expected id_parts to follow label_order and keep original casing"
  }

  assert {
    condition     = output.id == "production-web-server"
    error_message = "expected id to be lowercase join(delimiter, id_parts)"
  }

  assert {
    condition     = output.labels["environment"] == "Production"
    error_message = "expected labels to include environment"
  }

  assert {
    condition     = output.labels["name"] == "Web-Server"
    error_message = "expected labels to include name"
  }

  assert {
    condition     = output.labels["component"] == "compute"
    error_message = "expected extra_labels to be merged into labels"
  }
}

run "id_filters_empty_values" {
  command = plan

  variables {
    enabled     = true
    name        = "api"
    environment = ""
    delimiter   = "-"
    label_order = ["environment", "name"]
  }

  assert {
    condition     = output.id_parts == ["api"]
    error_message = "expected empty environment to be filtered from id_parts"
  }

  assert {
    condition     = output.id == "api"
    error_message = "expected id to contain only non-empty label values"
  }
}

run "validation_fails_for_empty_delimiter" {
  command = plan
  expect_failures = [
    var.delimiter,
  ]

  variables {
    enabled     = true
    name        = "x"
    environment = "dev"
    delimiter   = "   "
  }
}

run "validation_fails_for_invalid_label_order_key" {
  command = plan
  expect_failures = [
    var.label_order,
  ]

  variables {
    enabled     = true
    name        = "x"
    environment = "dev"
    label_order = ["environment", "nope", "name"]
  }
}

run "validation_fails_for_duplicate_label_order_keys" {
  command = plan
  expect_failures = [
    var.label_order,
  ]

  variables {
    enabled     = true
    name        = "x"
    environment = "dev"
    label_order = ["environment", "name", "name"]
  }
}

run "validation_fails_for_empty_extra_label_key_or_value" {
  command = plan
  expect_failures = [
    var.extra_labels,
  ]

  variables {
    enabled     = true
    name        = "x"
    environment = "dev"
    extra_labels = {
      ""      = "ok"
      "valid" = ""
    }
  }
}
