region     = "us-east-1"
access_key = "put your access key here"
secret_key = "put here in your own secret key"

# network Module Values
vpc_cidr_block             = "10.10.0.0/16"
public_subnet1_cidr_block  = "10.10.0.0/24"
public_subnet2_cidr_block  = "10.10.16.0/24"
private_subnet1_cidr_block = "10.10.32.0/24"
private_subnet2_cidr_block = "10.10.48.0/24"
private_subnet3_cidr_block = "10.10.64.0/24"
private_subnet4_cidr_block = "10.10.80.0/24"
private_subnet5_cidr_block = "10.10.96.0/24"
private_subnet6_cidr_block = "10.10.112.0/24"

# web module variable values
# web_ec2_ami_id        = "ami-0277155c3f0ab2930"
# web_ec2_instance_type = "t2.micro"

# app module variable values
# app_ec2_ami_id        = "ami-0277155c3f0ab2930"
# app_ec2_instance_type = "t2.micro"

# db module variable values
rds_storage_type      = "gp2"
rds_engine_name       = "mysql"
rds_db_engine_version = "8.0.35"
rds_instance_type     = "db.t2.micro"
rds_username          = "root"
rds_password          = "suraj1234"

# Auto-Scaling modules variable Values
web_template_ami_id        = "ami-0c7217cdde317cfec"
web_template_instance_type = "t2.micro"
web_template_key_name      = "terraform"
web_asg_desired_capacity   = "1"
web_asg_min_size           = "1"
web_asg_max_size           = "2"

app_template_ami_id        = "ami-0c7217cdde317cfec"
app_template_instance_type = "t2.micro"
app_template_key_name      = "terraform"
app_asg_desired_capacity   = "1"
app_asg_min_size           = "1"
app_asg_max_size           = "2"
