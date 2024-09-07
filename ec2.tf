module "bastion_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                  = "Bastion"
  create_spot_instance  = true
  spot_price            = "0.60"
  spot_type             = "persistent"
  instance_type         = "t2.micro"
  key_name              = "mac_aws"
  monitoring            = true
  vpc_security_group_ids = [module.ssh_sg.security_group_id]
  subnet_id             = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "develop"
  } 
}

module "cicd_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                  = "CI/CD-instance"
  create_spot_instance  = true
  spot_price            = "0.60"
  spot_type             = "persistent"
  instance_type         = "t2.micro"
  key_name              = "mac_aws"
  monitoring            = true
  vpc_security_group_ids = [aws_default_security_group.default.id]
  subnet_id             = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "develop"
  } 
}