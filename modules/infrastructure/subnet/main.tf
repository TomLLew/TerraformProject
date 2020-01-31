data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnet1" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = var.vpc_id
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.region}-${var.environment}-Subnet1-Public"
  }
}


