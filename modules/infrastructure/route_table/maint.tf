resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }
  tags = {
    Name = "${var.region}-${var.environment}-Route-Table"
  }
}
resource "aws_route_table_association" "route_association" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.route_table.id
}
