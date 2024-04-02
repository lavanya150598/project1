variable "iam_restrict_Shared_Vpc_Backend_Services_name" {
  type    = string
  default = "policies/iam.restrict_Shared_Vpc_Backend_Services"
}

variable "iam_restrict_Shared_Vpc_Backend_Services_scope" {
  type    = string
  default = "organization"
}

variable "iam_restrict_Shared_Vpc_Backend_Services_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "iam_restrict_Shared_Vpc_Backend_Services_allowed_values" {
  type    = list(string)
  default = []
}

variable "iam_restrict_Shared_Vpc_Backend_Services_denied_values" {
  type    = list(string)
  default = []
}

variable "iam_restrict_Shared_Vpc_Backend_Services_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
    values = object({
      allowed_values = list(string)
      denied_values  = list(string)
    })
  }))
  default = []
}

variable "iam_restrict_Shared_Vpc_Backend_Services_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
    values = object({
      allowed_values = list(string)
      denied_values  = list(string)
    })
  }))
  default = []
}

module "iam_restrict_Shared_Vpc_Backend_Services" {
  source             = "../module/list_policy"
  name               = var.iam_restrict_Shared_Vpc_Backend_Services_name
  scope              = var.iam_restrict_Shared_Vpc_Backend_Services_scope
  ids                = var.iam_restrict_Shared_Vpc_Backend_Services_scope == "organization" ? [var.organization_id] : var.iam_serviceAccountKeyExpiryHours_ids
  allowed_values     = var.iam_restrict_Shared_Vpc_Backend_Services_restrict_Shared_Vpc_Backend_Services_allowed_values
  allowed_values     = var.iam_restrict_Shared_Vpc_Backend_Services_restrict_Shared_Vpc_Backend_Services_allowed_values
  denied_values      = var.iam_restrict_Shared_Vpc_Backend_Services_denied_values
  allowed_conditions = var.iam_restrict_Shared_Vpc_Backend_Services_allowed_conditions
  denied_conditions  = var.iam_restrict_Shared_Vpc_Backend_Services_denied_conditions
}

