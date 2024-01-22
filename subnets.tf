# Fetch availability zones in region
data "aws_availability_zones" "az" {}

# Create subnets with the VPC
resource "aws_subnet" "subnet-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.az.names[0]

  tags = {
    Name = "${var.project_name}-subnet-1"
  }
}
# Create subnet-2 with the VPC
resource "aws_subnet" "subnet-2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.az.names[1]

  tags = {
    Name = "${var.project_name}-subnet-2"
  }
}
# Create subnet-3 with the VPC
resource "aws_subnet" "subnet-3" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet3_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.az.names[2]

  tags = {
    Name = "${var.project_name}-subnet-3"
  }
}
