resource "aws_instance" "app-ec2-1" {
  ami           = var.app_ec2_ami_id
  instance_type = var.app_ec2_instance_type
  vpc_security_group_ids = [aws_security_group.app-ec2-sg.id]
  subnet_id = var.private_sub3_id
  tags = {
        Name  = "app-Server1"
    }
}