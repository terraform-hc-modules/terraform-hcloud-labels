# Architecture

This module is a pure-local Terraform module: it **does not create resources** and has **no providers**. It computes a stable `id` and consistent `labels` from a small set of naming inputs.

## Data flow

```mermaid
flowchart TD
  subgraph Inputs
    enabled[enabled]
    name[name]
    environment[environment]
    project[project]
    owner[owner]
    managed_by[managed_by]
    label_order[label_order]
    delimiter[delimiter]
    extra_labels[extra_labels]
  end

  enabled --> locals_enabled[local.enabled]
  name --> label_values[local.label_values]
  environment --> label_values
  project --> label_values
  owner --> label_values
  managed_by --> label_values

  label_values --> base_labels[local.base_labels<br/>filter empty values]
  label_values --> id_parts[local.id_parts<br/>label_order + filter empties]
  label_order --> id_parts

  delimiter --> id[local.id<br/>lower(join(delimiter, id_parts))]
  id_parts --> id

  base_labels --> labels[local.labels<br/>merge(base_labels, extra_labels)]
  extra_labels --> labels

  labels --> labels_as_list[local.labels_as_list]

  locals_enabled --> outputs_enabled[output.enabled]
  id --> outputs_id[output.id]
  id_parts --> outputs_id_parts[output.id_parts]
  label_values --> outputs_label_values[output.label_values]
  base_labels --> outputs_base_labels[output.base_labels]
  labels --> outputs_labels[output.labels]
  labels_as_list --> outputs_labels_as_list[output.labels_as_list]
```

## Notes

- `label_order` controls which keys contribute to `id` and in what order.
- Empty label values are excluded from `id_parts` and `base_labels`.
- `labels` includes `extra_labels` merged on top of computed labels.
