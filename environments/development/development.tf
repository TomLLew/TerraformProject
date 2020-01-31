variable "environment" {
}
variable "region" {
}
variable "ami_id" {
}
variable "instance_type" {
}
variable "pem_key" {
}


provider "aws" {
  region  = var.region
  version = "~> 2.7"
}
module "infrastructure" {
  source        = "../../modules/infrastructure"
  environment   = var.environment
  region        = var.region
  ami_id        = var.ami_id
  instance_type = var.instance_type
  pem_key       = var.pem_key
}
