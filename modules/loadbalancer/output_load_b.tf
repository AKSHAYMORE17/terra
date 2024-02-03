output "internet_load_balancer_id" {
  value = aws_lb.internet_load_balancer.id
}
output "internal_load_balancer_id" {
    value = aws_lb.internal_load_balancer.id
}
output "internal_load_balancer_sg_id" {
  value = aws_security_group.internal_load_balancer_sg.id 
}
output "internet_load_balancer_security_group_id" {
  value = aws_security_group.internet_load_balancer_sg.id
}
output "web_lb_target_group_arn" {
  value = aws_lb_target_group.internet_load_b_target_group.id
}
output "app_lb_target_group_arn" {
  value = aws_lb_target_group.internal_lb_target_group.id
}