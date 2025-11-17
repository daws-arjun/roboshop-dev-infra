############################################################
# Local Values for CloudFront Setup
############################################################
locals {
  # CloudFront Managed Cache Policies
  cachingOptimised = data.aws_cloudfront_cache_policy.cachingOptimised.id
  cachingDisabled  = data.aws_cloudfront_cache_policy.cachingDisabled.id

  # ACM Certificate (from SSM)
  cdn_certificate_arn = data.aws_ssm_parameter.certificate_arn.value

  # Common resource tags
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Terraform   = "true"
  }
}
