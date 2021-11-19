resource "aws_vpc" "main" {
  cidr_block       = var.vpc_subnet

  tags = {
    environment_id = var.environment
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id

  cidr_block              = var.public_subnets_cidr
  
  map_public_ip_on_launch = true
  tags = {
    environment_id = var.environment
  }
}

resource "aws_subnet" "lambda_subnet" {
  vpc_id                  = aws_vpc.main.id
 
  cidr_block              = var.lambda_subnet_prefix

  map_public_ip_on_launch = false

 tags = {
    environment_id = var.environment
  }
}

}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.main.id
 
  cidr_block              = var.private_subnet_prefix

  map_public_ip_on_launch = false

 tags = {
    environment_id = var.environment
  }
}