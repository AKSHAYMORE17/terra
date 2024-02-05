resource "aws_lb" "internal_load_balancer" {
    name               = "load-balancer-internal"
    internal           = true
    load_balancer_type = "application"
    security_groups    = [aws_security_group.internal_load_balancer_sg.id]
    subnets            = [var.private_sub3_id, var.private_sub4_id]
}
resource "aws_lb_listener" "internal_lb_listener" {
    load_balancer_arn = aws_lb.internal_load_balancer.id
    port              = "80"
    protocol          = "HTTP"
    default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.internal_lb_target_group.id
    }
}
resource "aws_lb_target_group" "internal_lb_target_group" {
    name     = "internal-lb-tg"
    port     = 80
    protocol = "HTTP"
    vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "internal_lb_instance_attach" {
    target_group_arn = aws_lb_target_group.internal_lb_target_group.arn
    target_id        = var.app_auto_scaling_group_id
}