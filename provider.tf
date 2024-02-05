provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "surajnetwork" {
  source                     = "./modules/network"
  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet1_cidr_block  = var.public_subnet1_cidr_block
  public_subnet2_cidr_block  = var.public_subnet2_cidr_block
  private_subnet1_cidr_block = var.private_subnet1_cidr_block
  private_subnet2_cidr_block = var.private_subnet2_cidr_block
  private_subnet3_cidr_block = var.private_subnet3_cidr_block
  private_subnet4_cidr_block = var.private_subnet4_cidr_block
  private_subnet5_cidr_block = var.private_subnet5_cidr_block
  private_subnet6_cidr_block = var.private_subnet6_cidr_block
}

# module "surajweb" {
#   source                = "./modules/web"
#   web_ec2_ami_id        = var.web_ec2_ami_id
#   web_ec2_instance_type = var.web_ec2_instance_type
#   private_sub1_id       = module.surajnetwork.private_sub1_id
#   vpc_id                = module.surajnetwork.vpc_id
# }

# module "surajapp" {
#   source                = "./modules/app"
#   vpc_id                = module.surajnetwork.vpc_id
#   app_ec2_ami_id        = var.app_ec2_ami_id
#   app_ec2_instance_type = var.app_ec2_instance_type
#   web_security_sg_id    = module.surajweb.web_security_sg_id
#   private_sub3_id       = module.surajnetwork.private_sub3_id
# }

module "surajdb" {
  source          = "./modules/db"
  private_sub5_id = module.surajnetwork.private_sub5_id
  private_sub6_id = module.surajnetwork.private_sub6_id
  vpc_id          = module.surajnetwork.vpc_id
  # app_security_group_id          = module.surajapp.app_security_group_id
  app_tamplate_security_group_id = module.surajautoScaling.app_tamplate_security_group_id
  rds_storage_type               = var.rds_storage_type
  rds_engine_name                = var.rds_engine_name
  rds_db_engine_version          = var.rds_db_engine_version
  rds_instance_type              = var.rds_instance_type
  rds_username                   = var.rds_username
  rds_password                   = var.rds_password
}

module "surajloadbalancer" {
  source          = "./modules/loadbalancer"
  vpc_id          = module.surajnetwork.vpc_id
  public_sub1_id  = module.surajnetwork.public_sub1_id
  public_sub2_id  = module.surajnetwork.public_sub2_id
  private_sub3_id = module.surajnetwork.private_sub3_id
  private_sub4_id = module.surajnetwork.private_sub4_id
  # web_security_sg_id             = module.surajweb.web_security_sg_id
  web_template_security_group_id = module.surajautoScaling.web_template_security_group_id
  # web_ec2_id                     = module.surajweb.web_ec2_id
  # app_ec2_id                     = module.surajapp.app_ec2_id
  web_auto_scaling_group_id = module.surajautoScaling.web_auto_scaling_group_id
  app_auto_scaling_group_id = module.surajautoScaling.app_auto_scaling_group_id
}

module "surajautoScaling" {
  source                                   = "./modules/autoScaling"
  vpc_id                                   = module.surajnetwork.vpc_id
  internal_load_balancer_sg_id             = module.surajloadbalancer.internal_load_balancer_sg_id
  internet_load_balancer_security_group_id = module.surajloadbalancer.internet_load_balancer_security_group_id
  web_lb_target_group_arn                  = module.surajloadbalancer.web_lb_target_group_arn
  app_lb_target_group_arn                  = module.surajloadbalancer.app_lb_target_group_arn
  # web tamplate variable
  web_template_ami_id        = var.web_template_ami_id
  web_template_instance_type = var.web_template_instance_type
  web_template_key_name      = var.web_template_key_name
  web_asg_desired_capacity   = var.web_asg_desired_capacity
  web_asg_min_size           = var.web_asg_min_size
  web_asg_max_size           = var.web_asg_max_size
  # app template variable
  app_template_ami_id        = var.app_template_ami_id
  app_template_instance_type = var.app_template_instance_type
  app_template_key_name      = var.app_template_key_name
  app_asg_desired_capacity   = var.app_asg_desired_capacity
  app_asg_min_size           = var.app_asg_min_size
  app_asg_max_size           = var.app_asg_max_size

  private_sub1_id           = module.surajnetwork.private_sub1_id
  private_sub2_id           = module.surajnetwork.private_sub2_id
  private_sub3_id           = module.surajnetwork.private_sub3_id
  private_sub4_id           = module.surajnetwork.private_sub4_id
  internet_load_balancer_id = module.surajloadbalancer.internet_load_balancer_id
  internal_load_balancer_id = module.surajloadbalancer.internal_load_balancer_id
}