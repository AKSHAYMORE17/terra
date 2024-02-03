resource "aws_autoscaling_group" "web_asg" {
  name = "web-asg"
  desired_capacity = var.web_asg_desired_capacity
  min_size         = var.web_asg_min_size
  max_size         = var.web_asg_max_size
  launch_configuration = aws_launch_configuration.web_template.name
  vpc_zone_identifier  = [var.private_sub1_id, var.private_sub2_id]
  tag {
    key                 = "Name"
    value               = "web-asg"
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_autoscaling_attachment" "web_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
  # elb                   = var.internet_load_balancer_id
  lb_target_group_arn   = var.web_lb_target_group_arn

}
resource "aws_autoscaling_group" "app_asg" {
  name = "app-asg"
  desired_capacity = var.app_asg_desired_capacity
  min_size         = var.app_asg_min_size
  max_size         = var.app_asg_max_size
  launch_configuration = aws_launch_configuration.app_template.name
  vpc_zone_identifier  = [var.private_sub3_id, var.private_sub4_id]
  tag {
    key                 = "Name"
    value               = "app-asg"
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "app_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
  # elb                   = var.internal_load_balancer_id
  lb_target_group_arn   = var.app_lb_target_group_arn
}

