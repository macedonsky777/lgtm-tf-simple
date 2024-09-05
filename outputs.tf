output "bastion_ip_addr" {
  value       = module.bastion_instance.public_ip
  description = "The public IP address of the Bastion server instance."
}

output "cicd_ip_addr" {
  value       = module.cicd_instance.public_ip
  description = "The public IP address of the cicd server instance."
}

output "rds_endpoint" {
  value       = module.db.db_instance_endpoint
  description = "Endpoint of the rds."
}

output "rds_db_name" {
  value       = module.db.db_instance_name
  description = "db name"
}

output "rds_db_user" {
  value       = module.db.db_instance_username
  description = "db user name"
}

output "rds_db_pass" {
  value       = module.db.db_instance_master_user_secret_arn
  description = "db user pass"
}

output "db_instance_adress" {
  value = module.db.db_instance_address
}

output "db_subdomain_fqdn" {
  description = "Fully qualified domain name of the DB subdomain"
  value       = aws_route53_record.db_subdomain.fqdn
}

output "db_subdomain_name" {
  description = "Name of the DB subdomain"
  value       = aws_route53_record.db_subdomain.name
}
