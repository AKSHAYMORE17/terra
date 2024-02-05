variable "region" {
  type = string
}
variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}

# newtork Modules variable....
variable "vpc_cidr_block" {
}
variable "public_subnet1_cidr_block" {
}
variable "public_subnet2_cidr_block" {
}
variable "private_subnet1_cidr_block" {
}
variable "private_subnet2_cidr_block" {
}
variable "private_subnet3_cidr_block" {
}
variable "private_subnet4_cidr_block" {
}
variable "private_subnet5_cidr_block" {
}
variable "private_subnet6_cidr_block" {
}

# web module variables
# variable "web_ec2_ami_id" {
# }
# variable "web_ec2_instance_type" {
# }

# app module variables
# variable "app_ec2_ami_id" {
# }
# variable "app_ec2_instance_type" {
# }

# db module variables
variable "rds_storage_type" {
}
variable "rds_engine_name" {
}
variable "rds_db_engine_version" {
}
variable "rds_instance_type" {
}
variable "rds_username" {
}
variable "rds_password" {
}

# auto-Scaling module variables
variable "web_template_ami_id" {
}
variable "web_template_instance_type" {
}
variable "web_asg_desired_capacity" {
}
variable "web_asg_min_size" {
}
variable "web_asg_max_size" {
}
variable "app_asg_desired_capacity" {
}
variable "app_asg_min_size" {
}
variable "app_asg_max_size" {
}
variable "app_template_ami_id" {
}
variable "app_template_instance_type" {
}
variable "web_template_key_name" {
}
variable "app_template_key_name" {
}
