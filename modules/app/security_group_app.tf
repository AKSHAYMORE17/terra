# resource "aws_security_group" "app-ec2-sg" {
#     name = "app-ec2-sg"
#     vpc_id = var.vpc_id
#     ingress {
#         protocol = "tcp"
#         from_port = 80
#         to_port = 80
#         # cidr_blocks = ["0.0.0.0/0"]
#         security_groups = [ var.web_security_sg_id ]
#         }
#     egress {
#         from_port   = 0
#         to_port     = 0
#         protocol    = "-1"
#         cidr_blocks = ["0.0.0.0/0"] 
#         }
# }