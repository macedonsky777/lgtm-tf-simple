module "ssh_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"

  name        = "ssh"
  description = "Security group for ssh access"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "mysql_security_group" {
  source              = "terraform-aws-modules/security-group/aws//modules/mysql"
  version             = "~> 5.0"
  name                = "mysqlrds"
  vpc_id              = module.vpc.vpc_id
  description         = "Security group for mysql"
  ingress_cidr_blocks = ["192.168.0.0/27"]

}
resource "aws_default_security_group" "default" {
  vpc_id = module.vpc.vpc_id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
