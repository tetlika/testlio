resource "aws_vpc" "main" {
  cidr_block       = var.vpc_subnet

  tags = {
    Name = "main"
  }
}

