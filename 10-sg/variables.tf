###############################################
# Project Name
###############################################
variable "project_name" {
  type        = string
  default     = "roboshop"
}

###############################################
# Environment
###############################################
variable "environment" {
  type        = string
  default     = "dev"
}

###############################################
# Security Group Names (used to fetch from SSM)
###############################################
variable "sg_names" {
  type = list(string)

  default = [
    # --- Databases ---
    "mongodb",
    "redis",
    "mysql",
    "rabbitmq",

    # --- Backend Services ---
    "catalogue",
    "user",
    "cart",
    "shipping",
    "payment",

    # --- Frontend Service ---
    "frontend",

    # --- Bastion Host ---
    "bastion",

    # --- Load Balancers ---
    "frontend_alb",
    "backend_alb",

    # --- OpenVPN Server ---
    "open_vpn"
  ]
}
