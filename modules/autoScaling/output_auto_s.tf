output "app_tamplate_security_group_id" {
    value = aws_security_group.app_template_sg.id 
}
output "web_template_security_group_id" {
    value = aws_security_group.web_template_sg.id
}