# Creation of vpc resource

resource "aws_vpc" "demo-vpc" {
  cidr_block = var.cidr_range
  instance_tenancy = var.tenancy_value
  tags = {
    Name = var.vpc_name
  }
}

# Creation of subnets resources

resource "aws_subnet" "public-subnet-1" {
  cidr_block = var.public_subnet1_cidr
  vpc_id = aws_vpc.demo-vpc.id
  availability_zone = var.zone_1
  map_public_ip_on_launch = true

  tags = {
    name = var.public_subnet1_name
  }
}

resource "aws_subnet" "public-subnet-2" {
  cidr_block = var.public_subnet2_cidr
  vpc_id = aws_vpc.demo-vpc.id
  availability_zone = var.zone_2
  map_public_ip_on_launch = true

  tags = {
    name = var.public_subnet2_name
  }
}

resource "aws_subnet" "private-subnet" {
  cidr_block = var.private_subnet_cidr
  vpc_id = aws_vpc.demo-vpc.id
  availability_zone = var.zone_1

  tags = {
    Name = var.private_subnet_name
  }
}

# Creation of internet gateway

resource "aws_internet_gateway" "demo-IGW" {
  vpc_id = aws_vpc.demo-vpc.id
  tags = {
    Name = var.internet_gateway_name
  }
}

# Creation of route table

resource "aws_route_table" "demo-route-table" {
  vpc_id = aws_vpc.demo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-IGW.id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

# Associating the route table wth subnet 1

resource "aws_route_table_association" "association-subnet-1" {
  route_table_id = aws_route_table.demo-route-table.id
  subnet_id = aws_subnet.public-subnet-1.id
}

resource "aws_route_table_association" "association-subnet-2" {
  route_table_id = aws_route_table.demo-route-table.id
  subnet_id = aws_subnet.public-subnet-2.id
}

# Creating an security group
resource "aws_security_group" "demo-sg" {
  name = var.security_group_name
  vpc_id = aws_vpc.demo-vpc.id
  ingress {
    from_port = var.start_port
    protocol = var.protocol_allowed
    to_port = var.end_port
    cidr_blocks = var.cidr_allowed
  }

  egress {
    from_port = var.start_port
    protocol = var.protocol_allowed
    to_port = var.end_port
    cidr_blocks = var.cidr_allowed
  }

  tags = {
    Name = "demo-sg"
  }
}

# Creating a key-pair
resource "aws_key_pair" "my-key-pair" {
  key_name   = "my-key-pair"
  public_key = file(pathexpand("~/new_keys/my_keys.pub"))
}

# Creating an EC2 in subnet
resource "aws_instance" "demo-instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public-subnet-2.id
  availability_zone = var.zone_2
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  key_name = aws_key_pair.my-key-pair.key_name

  tags = {
    Name = var.instance_name
  }
}
