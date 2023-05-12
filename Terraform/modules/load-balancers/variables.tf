variable "load_balancers_subnets" {}
variable "load_balancers_vpc" {}
variable "instance_to_attach" {}

variable "load_balancer_name" {
  default = "demo-alb"
}

variable "load_balancer_type" {
  default = "application"
}

variable "traffic_type" {
  default = false
}

variable "ip_address_type" {
  default = "ipv4"
}

variable "tag_name" {
  default = "demo-alb"
}

variable "start_port" {
  default = 0
}

variable "end_port" {
  default = 0
}

variable "protocol_allowed" {
  default = "-1"
}

variable "cidr_allowed" {
  default = ["0.0.0.0/0"]
}

variable "security_group_name" {
  default = "my-alb-sg"
}

variable "target_group_name" {
  default = "my-alb-tg"
}

variable "target_group_port" {
  default = 80
}

variable "target_group_protocol" {
  default = "HTTP"
}

variable "target_type" {
  default = "instance"
}

variable "health_check_interval" {
  default = 30
}

variable "health_check_path" {
  default = "/"
}

variable "health_check_protocol" {
  default = "HTTP"
}

variable "health_check_timeout" {
  default = 5
}

variable "healthy_threshold" {
  default = 5
}

variable "unhealthy_threshold" {
  default = 2
}

variable "matcher" {
  default = "200-299"
}
