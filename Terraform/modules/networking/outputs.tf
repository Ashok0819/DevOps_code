output "subnet_ids" {
  value = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}

output "vpc_id" {
  value = aws_vpc.demo-vpc.id
}

output "instance_id" {
  value = aws_instance.demo-instance.id
}