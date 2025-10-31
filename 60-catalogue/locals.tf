locals {
    common_name_suffix = "${var.project_name}-${var.environment}" # roboshop-dev
    private_subnet_ids = split("," , data.aws_ssm_parameter.private_subnet_ids.value)
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
    ami_id = data.aws_ami.joindevops.id
    common_tags = {
        Project = var.project_name
        Environment = var.environment
        Terraform = "true"
    }
}
    

