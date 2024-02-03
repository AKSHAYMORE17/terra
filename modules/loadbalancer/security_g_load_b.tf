resource "aws_security_group" "internet_load_balancer_sg" {
    name        = "internet-load-balancer-sg"
    vpc_id = var.vpc_id
    ingress {
        protocol    = "tcp"
        from_port   = 80
        to_port     = 80
        cidr_blocks = ["0.0.0.0/0"]
        }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    tags = {
    Name = "internet-load-balancer"
  } 
}

resource "aws_security_group" "internal_load_balancer_sg" {
    name        = "internal-load-balancer-sg"
    vpc_id = var.vpc_id
    ingress {
        protocol    = "tcp"
        from_port   = 80
        to_port     = 80
        security_groups = [var.web_security_sg_id, var.web_template_security_group_id]
        }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    tags = {
    Name = "internal_load_balancer-sg"
  }
}