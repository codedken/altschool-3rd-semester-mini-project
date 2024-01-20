resource "aws_lb" "my_load_balancer" {
  name                       = "my-load-balancer"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.lb-sg.id]
  subnets                    = [aws_subnet.subnet-1.id, aws_subnet.subnet-2.id, aws_subnet.subnet-3.id]
  enable_deletion_protection = false
  depends_on                 = [aws_internet_gateway.igw]
}

resource "aws_lb_target_group" "my_target_group" {
  name        = "my-target-group"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

}

locals {
  servers = {
    s1 = "${aws_instance.app1.id}"
    s2 = "${aws_instance.app2.id}"
    s3 = "${aws_instance.app3.id}"
  }
}

resource "aws_lb_target_group_attachment" "my_target_group_att" {
  for_each         = local.servers
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = each.value
  port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.my_target_group.id
    type             = "forward"
  }
}
