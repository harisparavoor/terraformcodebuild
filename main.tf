module "Network" {
  source = "./Network"
  vpc_cidr = var.vpc_cidr
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet
}

module "EC2" {
  source = "./EC2"
  vpc_cidr = var.vpc_cidr
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet
  public_ip = var.public_ip
 # instance_web2_id = var.instance_web2_id
  windows_ami = var.windows_ami
  public_key =  var.public_key
  amazon_linux_ami = var.amazon_linux_ami
  instance_type = var.instance_type
  instance_iam_profile = var.instance_iam_profile
  vpc_id = module.Network.vpc_id
  public_subnet_id = module.Network.public_subnet_id
  private_subnet_id = module.Network.private_subnet_id
}

  
