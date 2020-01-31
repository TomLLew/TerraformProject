variable "ingress_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 443]
}
variable "open_internet" {
  description = "the open internet"
  default     = ["0.0.0.0/0"]
}
variable "outbound_ports" {
  description = "list of egress ports"
  default     = 0
}
variable "environment" {
}
variable "region" {
}
variable "vpc_id" {
}
