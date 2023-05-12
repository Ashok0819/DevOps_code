variable "cidr_range" {
  default = "10.0.0.0/16"
}

variable "tenancy_value" {
  default = "default"
}

variable "vpc_name" {
  default = "demo-vpc"
}

variable "public_subnet1_cidr" {
  default = "10.0.0.0/24"
}

variable "zone_1" {
  default = "us-east-1a"
}

variable "public_subnet1_name" {
  default = "public-subnet"
}

variable "public_subnet2_cidr" {
  default = "10.0.1.0/24"
}

variable "zone_2" {
  default = "us-east-1b"
}

variable "public_subnet2_name" {
  default = "public-subnet-2"
}

variable "private_subnet_cidr" {
  default = "10.0.16.0/20"
}

variable "private_subnet_name" {
  default = "private-subnet"
}

variable "internet_gateway_name" {
  default = "demo-IGW"
}

variable "public_route_table_name" {
  default = "demo-route-table"
}

variable "security_group_name" {
  default = "demo-sg"
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

variable "ami_id" {
  default = "ami-007855ac798b5175e"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "demo-instance"
}
