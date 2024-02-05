resource "aws_lb" "internet_load_balancer" {
    name               = "load-balancer-internet"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.internet_load_balancer_sg.id]
    subnets            = [var.public_sub1_id, var.public_sub2_id]
}

resource "aws_lb_listener" "internet_load_listener" {
    load_balancer_arn = aws_lb.internet_load_balancer.id
    port              = "80"
    protocol          = "HTTP"
    default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.internet_load_b_target_group.id
    }
}
resource "aws_lb_target_group" "internet_load_b_target_group" {
    name     = "internet-target-group"
    port     = 80
    protocol = "HTTP"
    vpc_id   = var.vpc_id
    health_check {
    path      = "/"
    interval   = "30"
    timeout    = "5"
    unhealthy_threshold = "2"
    healthy_threshold   = "2"
    }
}
resource "aws_lb_target_group_attachment" "internet_lb_target_g_attach" {
    target_group_arn = aws_lb_target_group.internet_load_b_target_group.arn
    target_id        = var.web_auto_scaling_group_id
}
