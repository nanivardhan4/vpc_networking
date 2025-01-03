provider "aws" {
region = "us-west-1"
}
resource "aws_vpc" "main" {
cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "subnet" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.1.0/24"
availability_zone = "us-west-1a"
}
resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.main.id
}
resource "aws_route_table" "route_table" {
vpc_id = aws_vpc.main.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
}
}