module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "192.168.0.0/25"

  azs             = ["eu-central-1a", "eu-central-11b", "eu-central-1c"]
  private_subnets = ["192.168.0.0/27"]
  public_subnets  = ["192.168.0.32/27"]

  enable_nat_gateway = false

  tags = {
    Terraform = "true"
    Environment = "develop"
  }
}
