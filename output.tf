output "wordpress_ip_address" {
  value       = data.kubernetes_service.wordpress_svc.status[0].load_balancer[0].ingress[0].ip
  description = "Wordpress public IP address to access it."
}

output "wordpress_admin_user" {
  value       = var.wordpress_username
  description = "Wordpress admin user."  
}

output "wordpress_password" {
  value       = nonsensitive(random_password.password.result)
  description = "Random generated password for wordpress admin user."
}