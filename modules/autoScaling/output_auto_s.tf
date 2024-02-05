output "app_tamplate_security_group_id" {
    value = aws_security_group.app_template_sg.id 
}
output "web_template_security_group_id" {
    value = aws_security_group.web_template_sg.id
}
output "web_auto_scaling_group_id" {
    value = aws_autoscaling_group.web_asg.id
}
output "app_auto_scaling_group_id" {
    value = aws_autoscaling_group.app_asg.id
}