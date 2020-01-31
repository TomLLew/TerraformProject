module "vpc" {
  source      = "./vpc"
  environment = var.environment
  region      = var.region
}
module "subnet" {
  source      = "./subnet"
  environment = var.environment
  region      = var.region
  vpc_id      = module.vpc.vpc_id
}
module "security_group" {
  source      = "./security_group"
  environment = var.environment
  region      = var.region
  vpc_id      = module.vpc.vpc_id
}
module "route_table" {
  source      = "./route_table"
  environment = var.environment
  region      = var.region
  vpc_id      = module.vpc.vpc_id
  gateway_id  = module.internet_gateway.gateway_id
  subnet_id   = module.subnet.subnet_id
}
module "internet_gateway" {
  source      = "./internet_gateway"
  environment = var.environment
  region      = var.region
  vpc_id      = module.vpc.vpc_id
}
module "auto_scaling_group" {
  source        = "./asg"
  environment   = var.environment
  region        = var.region
  ami_id        = var.ami_id
  instance_type = var.instance_type
  pem_key       = var.pem_key
  sg_id         = module.security_group.sg_id
  subnet_id     = module.subnet.subnet_id
  start_time    = var.start_time
  stop_time     = var.stop_time
}






