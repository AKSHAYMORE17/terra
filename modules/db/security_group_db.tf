resource "aws_security_group" "db_instance_sg" {
    name = "db-instance-sg"
    vpc_id = var.vpc_id
    ingress {
        protocol = "tcp"
        from_port = 3306
        to_port = 3306
        security_groups = [var.app_security_group_id,var.app_tamplate_security_group_id]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}