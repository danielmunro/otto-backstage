module "networking" {
  source = "./modules/networking"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = var.production_availability_zones
}

module "lambda" {
  source = "./modules/lambda"
  public_subnet_id = module.networking.public_subnet_id
  security_group_id = module.networking.security_group_id
}
