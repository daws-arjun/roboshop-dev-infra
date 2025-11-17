##########################################
# Security Group Rules - ingress-only
# Assumes corresponding local.*_sg_id values exist
##########################################

# -------------------------
# MongoDB (port 27017) rules
# -------------------------
resource "aws_security_group_rule" "mongodb_bastion" {
  type                     = "ingress"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  type                     = "ingress"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.catalogue_sg_id
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "mongodb_user" {
  type                     = "ingress"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.user_sg_id
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
}

# -------------------------
# Redis (port 6379) rules
# -------------------------
resource "aws_security_group_rule" "redis_bastion" {
  type                     = "ingress"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "redis_user" {
  type                     = "ingress"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.user_sg_id
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "redis_cart" {
  type                     = "ingress"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.cart_sg_id
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
}

# -------------------------
# MySQL (port 3306) rules
# -------------------------
# Note: Bastion is allowed SSH (22) to MySQL host for maintenance.
resource "aws_security_group_rule" "mysql_bastion" {
  type                     = "ingress"
  security_group_id        = local.mysql_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "mysql_shipping" {
  type                     = "ingress"
  security_group_id        = local.mysql_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
}

# -------------------------
# RabbitMQ (port 5672) rules
# -------------------------
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type                     = "ingress"
  security_group_id        = local.rabbitmq_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  type                     = "ingress"
  security_group_id        = local.rabbitmq_sg_id
  source_security_group_id = local.payment_sg_id
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
}

# -------------------------
# Catalogue SG rules
# -------------------------
resource "aws_security_group_rule" "catalogue_bastion" {
  type                     = "ingress"
  security_group_id        = local.catalogue_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "catalogue_backend_alb" {
  type                     = "ingress"
  security_group_id        = local.catalogue_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
}

# The following rule was intentionally disabled — traffic should flow via backend ALB
# (cart → catalogue direct access is NOT allowed).
# /* resource "aws_security_group_rule" "catalogue_cart" {
#   type                     = "ingress"
#   security_group_id        = local.catalogue_sg_id
#   source_security_group_id = local.cart_sg_id
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
# } */

# -------------------------
# User SG rules
# -------------------------
resource "aws_security_group_rule" "user_bastion" {
  type                     = "ingress"
  security_group_id        = local.user_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "user_backend_alb" {
  type                     = "ingress"
  security_group_id        = local.user_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
}

# -------------------------
# Cart SG rules
# -------------------------
resource "aws_security_group_rule" "cart_bastion" {
  type                     = "ingress"
  security_group_id        = local.cart_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "cart_backend_alb" {
  type                     = "ingress"
  security_group_id        = local.cart_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
}

# -------------------------
# Shipping SG rules
# -------------------------
resource "aws_security_group_rule" "shipping_bastion" {
  type                     = "ingress"
  security_group_id        = local.shipping_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "shipping_backend_alb" {
  type                     = "ingress"
  security_group_id        = local.shipping_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
}

# -------------------------
# Payment SG rules
# -------------------------
resource "aws_security_group_rule" "payment_bastion" {
  type                     = "ingress"
  security_group_id        = local.payment_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "payment_backend_alb" {
  type                     = "ingress"
  security_group_id        = local.payment_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "payment_shipping" {
  type                     = "ingress"
  security_group_id        = local.payment_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
}

# -------------------------
# Backend ALB SG rules (who can reach the ALB)
# -------------------------
resource "aws_security_group_rule" "backend_alb_bastion" {
  type                     = "ingress"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "backend_alb_frontend" {
  type                     = "ingress"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.frontend_sg_id
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "backend_alb_cart" {
  type                     = "ingress"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.cart_sg_id
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "backend_alb_shipping" {
  type                     = "ingress"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "backend_alb_payment" {
  type                     = "ingress"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.payment_sg_id
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
}

# -------------------------
# Frontend SG rules
# -------------------------
resource "aws_security_group_rule" "frontend_bastion" {
  type                     = "ingress"
  security_group_id        = local.frontend_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "frontend_frontend_alb" {
  type                     = "ingress"
  security_group_id        = local.frontend_sg_id
  source_security_group_id = local.frontend_alb_sg_id
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
}

# -------------------------
# Frontend ALB (public) rules - allow HTTPS from internet
# -------------------------
resource "aws_security_group_rule" "frontend_alb_public" {
  type              = "ingress"
  security_group_id = local.frontend_alb_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
}

# -------------------------
# Bastion host access (laptop IP)
# -------------------------
resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id
  cidr_blocks       = ["0.0.0.0/0"]   # TODO: tighten to office/home IPs
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}

# -------------------------
# OpenVPN Access Rules
# -------------------------
resource "aws_security_group_rule" "open_vpn_public" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}

# OpenVPN Admin UI (TCP 943)
resource "aws_security_group_rule" "open_vpn_943" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
}

# OpenVPN HTTPS fallback (TCP 443)
resource "aws_security_group_rule" "open_vpn_443" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
}

# OpenVPN UDP port (1194)
resource "aws_security_group_rule" "open_vpn_1194" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 1194
  to_port           = 1194
  protocol          = "udp"
}

##########################################
# VPN → Catalogue Access
##########################################

# For SSH access
resource "aws_security_group_rule" "catalogue_vpn" {
  type                     = "ingress"
  security_group_id        = local.catalogue_sg_id
  source_security_group_id = local.open_vpn_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

# For Developers (port 8080)
resource "aws_security_group_rule" "catalogue_vpn_8080" {
  type                     = "ingress"
  security_group_id        = local.catalogue_sg_id
  source_security_group_id = local.open_vpn_sg_id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
}

##########################################
# VPN → All Components (Dynamic Rules)
##########################################

resource "aws_security_group_rule" "components_vpn" {
  for_each = local.vpn_ingress_rules

  type                     = "ingress"
  security_group_id        = each.value.sg_id
  source_security_group_id = local.open_vpn_sg_id
  from_port                = each.value.port
  to_port                  = each.value.port
  protocol                 = "tcp"
}

# -------------------------
# Intentionally disabled (design mistake).
# These rules allow direct component-to-component traffic and were removed.
# Traffic must go via backend ALB for security / routing consistency.
# -------------------------
# /* resource "aws_security_group_rule" "cart_shipping" {
#   type                     = "ingress"
#   security_group_id        = local.cart_sg_id
#   source_security_group_id = local.shipping_sg_id
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
# } */
#
# /* resource "aws_security_group_rule" "user_payment" {
#   type                     = "ingress"
#   security_group_id        = local.user_sg_id
#   source_security_group_id = local.payment_sg_id
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
# } */
#
# /* resource "aws_security_group_rule" "cart_payment" {
#   type                     = "ingress"
#   security_group_id        = local.cart_sg_id
#   source_security_group_id = local.payment_sg_id
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
# } */
