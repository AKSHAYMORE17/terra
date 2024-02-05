resource "aws_launch_configuration" "web_template" {
  name          = "web-template"
  image_id      = var.web_template_ami_id
  instance_type = var.web_template_instance_type
  key_name      = var.web_template_key_name
  security_groups = [aws_security_group.web_template_sg.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "app_template" {
  name          = "app-template"
  image_id      = var.app_template_ami_id
  instance_type = var.app_template_instance_type
  key_name      = var.app_template_key_name
  security_groups = [aws_security_group.app_template_sg.id]

  lifecycle {
    create_before_destroy = true
  }
}