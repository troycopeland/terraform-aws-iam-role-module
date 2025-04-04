# Terraform AWS IAM Role Module

Reusable Terraform module for creating AWS IAM roles with:

- Custom role name
- Trust (assume role policy)
- Optional permission boundary
- One or more attached managed policies
- Tag support

---

## Features

- Cleanly creates IAM roles with configurable trust relationships
- Supports attaching multiple AWS-managed or custom policies
- Optional permissions boundary enforcement
- Modular, reusable, and cleanly abstracted for team use

---

## Usage Example

```hcl
module "iam_role_example" {
  source = "../"

  role_name         = "example-terraform-module-role"
  assume_role_policy = data.aws_iam_policy_document.assume_ec2.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  ]

  tags = {
    Project = "iam-module"
    Owner   = "troycopeland"
  }
}
```

---

## Required Inputs

| Variable                 | Type    | Description                                         |
|--------------------------|---------|-----------------------------------------------------|
| `role_name`              | string  | Name of the IAM role                                |
| `assume_role_policy`     | string  | JSON trust policy (e.g., for EC2)                   |
| `managed_policy_arns`    | list    | List of policy ARNs to attach                       |
| `permissions_boundary_arn` | string | (Optional) ARN for permissions boundary             |
| `tags`                   | map     | Tags to apply to the role                           |

---

## Outputs

| Output      | Description                     |
|-------------|---------------------------------|
| `role_name` | Name of the IAM role created    |
| `role_arn`  | ARN of the IAM role created     |

---

## Why It Matters

In real infrastructure, IAM role creation is repetitive and error-prone. Abstracting it into a reusable module promotes consistency, compliance, and speed across teams.