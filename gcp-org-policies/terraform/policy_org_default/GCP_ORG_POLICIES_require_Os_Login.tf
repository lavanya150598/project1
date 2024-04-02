variable "require_Os_Login_name" {
  type    = string
  default = "policies/iam.require_Os_Login"
}

variable "iam_require_Os_Login" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "iam_require_Os_Login_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "iam_require_Os_Login" {
  source             = "../module/binary_policy"
  name               = var.iam_require_Os_Login_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.iam_require_Os_Login_allowed_conditions
  denied_conditions  = var.iam_require_Os_Login_denied_conditions
}