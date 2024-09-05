module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "192.168.0.0/25"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["192.168.0.0/27"]
  public_subnets  = ["192.168.0.32/27"]

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "develop"
  }
}
