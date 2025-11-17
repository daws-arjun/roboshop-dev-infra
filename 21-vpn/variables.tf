###############################################
# Project Name
###############################################
variable "project_name" {
  type        = string
  default     = "roboshop"
  description = "Name of the project used for naming AWS resources."
}

###############################################
# Deployment Environment
###############################################
variable "environment" {
  type        = string
  default     = "dev"
  description = "Deployment environment (dev/stage/prod)."
}

###############################################
# Route53 Hosted Zone ID
###############################################
variable "zone_id" {
  type        = string
  default     = "Z06547222JC0EDVX2ID1B"
  description = "Route53 hosted zone ID used for DNS record creation."
}

###############################################
# Domain Name
###############################################
variable "domain_name" {
  type        = string
  default     = "anuarjun.space"
  description = "Root domain name for Route53 DNS configuration."
}
