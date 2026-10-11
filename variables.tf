variable "branch_policy_merge_types" {
  description = <<EOT
Map of branch_policy_merge_types, attributes below
Required:
    - project_id
    - settings (block):
        - allow_basic_no_fast_forward (optional)
        - allow_rebase_and_fast_forward (optional)
        - allow_rebase_with_merge (optional)
        - allow_squash (optional)
        - scope (required, block):
            - match_type (optional)
            - repository_id (optional)
            - repository_ref (optional)
Optional:
    - blocking
    - enabled
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    project_id = string
    blocking   = optional(bool)
    enabled    = optional(bool)
    settings = object({
      allow_basic_no_fast_forward   = optional(bool)
      allow_rebase_and_fast_forward = optional(bool)
      allow_rebase_with_merge       = optional(bool)
      allow_squash                  = optional(bool)
      scope = list(object({
        match_type     = optional(string)
        repository_id  = optional(string)
        repository_ref = optional(string)
      }))
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.branch_policy_merge_types : (
        length(v.settings.scope) >= 1
      )
    ])
    error_message = "Each scope list must contain at least 1 items"
  }
}

