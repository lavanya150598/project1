variable "iam_restrict_partner_dedicated_interconnect_usage_name" {
  type    = string
  default = "policies/iam.iam_restrict_partner_dedicated_interconnect_usage_name"
}

variable "iam_restrict_partner_dedicated_interconnect_usage_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "iam_restrict_partner_dedicated_interconnect_usage_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "iam_restrict_partner_dedicated_interconnect_usage_allowed_conditions" {
  source             = "../module/binary_policy"
  name               = var.iam_restrict_partner_dedicated_interconnect_usage_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.iam_restrict_partner_dedicated_interconnect_usage_allowed_conditions
  denied_conditions  = var.iam_restrict_partner_dedicated_interconnect_usage_denied_conditions
}