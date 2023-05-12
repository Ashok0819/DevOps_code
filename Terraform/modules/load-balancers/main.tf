
# Setting up Load Balancer
resource "aws_lb" "demo-alb" {
  name = var.load_balancer_name
  internal = var.traffic_type
  load_balancer_type = var.load_balancer_type
  ip_address_type  = var.ip_address_type
  subnets = var.load_balancers_subnets
  enable_deletion_protection = true
  security_groups = [aws_security_group.alb-sg.id]

  tags = {
    Name = var.tag_name
  }
}

resource "aws_lb_target_group" "my-alb-tg" {
  name = var.target_group_name
  port = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id = var.load_balancers_vpc
  target_type = var.target_type

  health_check {
    interval = var.health_check_interval
    path = var.health_check_path
    protocol = var.health_check_protocol
    timeout = var.health_check_timeout
    healthy_threshold = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    matcher = var.matcher
  }
}

resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.demo-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-alb-tg.arn
  }
}

resource "aws_lb_target_group_attachment" "my-tg-attachment1" {
  target_group_arn = aws_lb_target_group.my-alb-tg.arn
  target_id = var.instance_to_attach
  port = 80
}

resource "aws_security_group" "alb-sg" {
  name = var.security_group_name
  vpc_id = var.load_balancers_vpc

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = var.cidr_allowed
  }

  egress {
    from_port = var.start_port
    protocol = var.protocol_allowed
    to_port = var.end_port
    cidr_blocks = var.cidr_allowed
  }
}
