output "branch_policy_merge_types_id" {
  description = "Map of id values across all branch_policy_merge_types, keyed the same as var.branch_policy_merge_types"
  value       = { for k, v in azuredevops_branch_policy_merge_types.branch_policy_merge_types : k => v.id }
}
output "branch_policy_merge_types_blocking" {
  description = "Map of blocking values across all branch_policy_merge_types, keyed the same as var.branch_policy_merge_types"
  value       = { for k, v in azuredevops_branch_policy_merge_types.branch_policy_merge_types : k => v.blocking }
}
output "branch_policy_merge_types_enabled" {
  description = "Map of enabled values across all branch_policy_merge_types, keyed the same as var.branch_policy_merge_types"
  value       = { for k, v in azuredevops_branch_policy_merge_types.branch_policy_merge_types : k => v.enabled }
}
output "branch_policy_merge_types_project_id" {
  description = "Map of project_id values across all branch_policy_merge_types, keyed the same as var.branch_policy_merge_types"
  value       = { for k, v in azuredevops_branch_policy_merge_types.branch_policy_merge_types : k => v.project_id }
}
output "branch_policy_merge_types_settings" {
  description = "Map of settings values across all branch_policy_merge_types, keyed the same as var.branch_policy_merge_types"
  value       = { for k, v in azuredevops_branch_policy_merge_types.branch_policy_merge_types : k => one(v.settings) }
}

