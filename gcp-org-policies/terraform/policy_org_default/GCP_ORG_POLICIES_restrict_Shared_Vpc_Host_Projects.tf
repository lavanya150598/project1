variable "iam_restrict_Shared_Vpc_Host_Projects_iam_name" {
  type    = string
  default = "cloudresourcemanager.googleapis.com"
}

variable "iam_restrict_Shared_Vpc_Host_Projects_iam_scope" {
  type    = string
  default = "folder"
}

variable "iam_restrict_Shared_Vpc_Host_Projects_iam_ids" {
  type = list(string)
}

variable "iam_restrict_Shared_Vpc_Host_Projects_iam_rules" {
  type = list(object({
    rule = object({
      description                 = string
      denied_principals           = list(string)
      denied_permissions          = list(string)
      exception_principals        = list(string)
      denied_condition_expression = string
    })
  }))
  default = []
}

module "iam_denyPolicy_iam" {
  source     = "../module/deny_policy"
  policy_id  = "iam-restrict_Shared_Vpc_Host_Projects-iam"
  name       = var.iam_restrict_Shared_Vpc_Host_Projects_iam_name
  scope      = var.iam_restrict_Shared_Vpc_Host_Projects_iam_scope
  ids        = var.iam_restrict_Shared_Vpc_Host_Projects_iam_ids
  deny_rules = var.iam_restrict_Shared_Vpc_Host_Projects_iam_rules
}

