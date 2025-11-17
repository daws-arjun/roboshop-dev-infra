############################################################
# Local Values for OpenVPN Module
############################################################
locals {
  # OpenVPN AMI ID
  ami_id = data.aws_ami.openvpn.id

  # Security Group ID for OpenVPN
  openvpn_sg_id = data.aws_ssm_parameter.openvpn_sg_id.value

  # First public subnet (OpenVPN must be public)
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]

  # Common Tags
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Terraform   = "true"
  }
}
