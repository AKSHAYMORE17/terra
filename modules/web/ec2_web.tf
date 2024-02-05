# resource "aws_instance" "web-ec2-1" {
#   ami           = var.web_ec2_ami_id
#   instance_type = var.web_ec2_instance_type
#   key_name = "terraform"
#   vpc_security_group_ids = [aws_security_group.web-ec2-sg.id]
#   subnet_id = var.private_sub1_id
#   tags = {
#         Name  = "Web-Server1"
#     }
# }