resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy

  permissions_boundary = var.permissions_boundary_arn != "" ? var.permissions_boundary_arn : null

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  count      = length(var.managed_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = var.managed_policy_arns[count.index]
}