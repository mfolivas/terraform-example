provider "aws" {
  region = "us-east-1"
}

variable "cidr_blocks" {
  description = "cidr blocks for vpc and subnets"
  type = list(string)
}

variable "environment" {
  description = "environment name"
}
resource "aws_vpc" "development-vpc" {
  cidr_block = var.cidr_blocks[0]
  tags = {
    Name: var.environment
    vpc_env: "dev"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.cidr_blocks[1]
  availability_zone = "us-east-1a"
  tags = {
    Name: "subtet-1dev"
  }
}

output "dev-vpc-id" {
  value = aws_vpc.development-vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}