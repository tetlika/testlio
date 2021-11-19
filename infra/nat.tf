resource "aws_eip" "nat_eip" {
  vpc        = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet
 
    tags = {
    environment_id = var.environment
  }

}