module "stage" {
  for_each = toset(var.instance_name)
  source = "./module/compute_instance"
  instance_name = each.value
  disk_size = 10
  vpc = module.vpc.vpc_name
  subnetwork = module.vpc.subnet_name
  
}

module "vpc" {
  source = "./module/vpc"
  vpc_name = "terraformtest"
  subnet_name = "terraformtest1"
  subnet_region = "asia-south1"
  subnet_CIDR = "10.0.4.0/24"

}
