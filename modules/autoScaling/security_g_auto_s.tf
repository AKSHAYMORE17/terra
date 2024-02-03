resource "aws_security_group" "web_template_sg" {
    name = "web-template-sg"
    vpc_id = var.vpc_id
    ingress {
        protocol = "tcp"
        from_port = 80
        to_port = 80
        security_groups = [ var.internet_load_balancer_security_group_id ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
    Name = "Web-template-sg"
  } 
}

resource "aws_security_group" "app_template_sg" {
    name = "app-template-sg"
    vpc_id = var.vpc_id
    ingress {
        protocol = "tcp"
        from_port = 80
        to_port = 80
        security_groups = [ var.internal_load_balancer_sg_id ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
    Name = "app-template-sg"
  } 
}