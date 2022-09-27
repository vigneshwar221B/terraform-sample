resource "aws_alb" "mod_web_alb" {
  name            = "lamp-alb"
  security_groups = [aws_security_group.mod_alb.id]
  subnets         = var.public_subnet_ids
  depends_on = [
    aws_instance.mod_web
  ]
  tags = {
    Name = "web_alb"
  }
}

resource "aws_alb_target_group" "mod_alb_group" {
  name        = "lamp-alb-target"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  # Alter the destination of the health check to be the index page.
  health_check {
    path = "/"
    port = 80
  }
}

resource "aws_alb_listener" "mod_listener_http" {
  load_balancer_arn = aws_alb.mod_web_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.mod_alb_group.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "mod_alb_web_attachment" {
  count            = length(aws_instance.mod_web.*.id)
  target_group_arn = aws_alb_target_group.mod_alb_group.arn
  target_id        = aws_instance.mod_web[count.index].id
  port             = 80
}
