module "vpc" {
    # vpc
    source        = "git::https://github.com/daws-arjun/terraform-aws-vpc-peering.git?ref=main"
    vpc_cidr      = var.vpc_cidr
    project_name  = var.project_name
    environment   = var.environment
    vpc_tags      = var.vpc_tags

    # public subnets
    public_subnet_cidrs = var.public_subnet_cidrs

    # private subnets
    private_subnet_cidrs = var.private_subnet_cidrs

    # database subnets
    database_subnet_cidrs = var.database_subnet_cidrs

    # peering
    is_peering_required = false # if not required false , required true
}
    
