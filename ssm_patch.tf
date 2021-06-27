module "label_ssm_patch_s3_log_policy" {
  source  = "cloudposse/label/null"
  version = "0.24.1"

  attributes = ["ssm-patch-s3-logs"]
  context    = module.this.context
}

data "aws_iam_policy_document" "ssm_patch_s3_log_policy" {
  count = local.ssm_path_log_bucket_enabled ? 1 : 0
  statement {
    sid = "AllowAccessToPathLogBucket"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetEncryptionConfiguration",
    ]
    resources = [
      "arn:aws:s3:::${var.ssm_patch_manager_s3_log_bucket}/*",
      "arn:aws:s3:::${var.ssm_patch_manager_s3_log_bucket}",
    ]
  }
}

resource "aws_iam_policy" "ssm_patch_s3_log_policy" {
  count       = local.ssm_path_log_bucket_enabled ? 1 : 0
  name        = module.label_ssm_patch_s3_log_policy.id
  path        = "/"
  description = "Policy to allow the local SSM agent on the instance to write the log output to the defined bucket"
  policy      = data.aws_iam_policy_document.ssm_patch_s3_log_policy[0].json
}


resource "aws_iam_role_policy_attachment" "ssm_core" {
  count      = local.enabled ? local.instance_profile_count : 0
  role       = aws_iam_role.default[count.index].name
  policy_arn = local.ssm_policy
}

resource "aws_iam_role_policy_attachment" "ssm_s3_policy" {
  count      = local.enabled && local.ssm_path_log_bucket_enabled ? local.instance_profile_count : 0
  role       = aws_iam_role.default[count.index].name
  policy_arn = aws_iam_policy.ssm_patch_s3_log_policy[0].arn
}