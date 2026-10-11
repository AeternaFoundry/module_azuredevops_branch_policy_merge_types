resource "azuredevops_branch_policy_merge_types" "branch_policy_merge_types" {
  for_each = var.branch_policy_merge_types

  project_id = each.value.project_id
  blocking   = each.value.blocking
  enabled    = each.value.enabled

  settings {
    allow_basic_no_fast_forward   = each.value.settings.allow_basic_no_fast_forward
    allow_rebase_and_fast_forward = each.value.settings.allow_rebase_and_fast_forward
    allow_rebase_with_merge       = each.value.settings.allow_rebase_with_merge
    allow_squash                  = each.value.settings.allow_squash
    dynamic "scope" {
      for_each = each.value.settings.scope
      content {
        match_type     = scope.value.match_type
        repository_id  = scope.value.repository_id
        repository_ref = scope.value.repository_ref
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

