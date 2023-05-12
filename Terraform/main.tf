module "networking" {
  source = "./modules/networking"
}

module "load-balancers" {
  source = "./modules/load-balancers"
  load_balancers_subnets = module.networking.subnet_ids
  load_balancers_vpc = module.networking.vpc_id
  instance_to_attach = module.networking.instance_id
}