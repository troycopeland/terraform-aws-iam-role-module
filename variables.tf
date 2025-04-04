variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The assume role policy (trust policy) as JSON"
  type        = string
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach"
  type        = list(string)
  default     = []
}

variable "permissions_boundary_arn" {
  description = "ARN of the permissions boundary (optional)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags to apply"
  type        = map(string)
  default     = {}
}