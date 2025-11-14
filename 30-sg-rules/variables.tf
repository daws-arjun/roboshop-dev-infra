###############################################
# Project Name
###############################################
variable "project_name" {
  type        = string
  default     = "roboshop"
  description = "Name of the project used for tagging and naming AWS resources."
}

###############################################
# Deployment Environment
###############################################
variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment to deploy into (e.g., dev, qa, stage, prod)."
}
