resource "aws_security_group" "security_group" {
  name   = "${var.region}-${var.environment}-Security-Group"
  vpc_id = var.vpc_id
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      cidr_blocks = var.open_internet
    }
  }
  egress {
    from_port   = var.outbound_ports
    protocol    = "-1"
    to_port     = var.outbound_ports
    cidr_blocks = var.open_internet
  }
}
