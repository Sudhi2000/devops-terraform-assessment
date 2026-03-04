output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "secret_arn" {
  description = "Secrets Manager ARN"
  value       = aws_secretsmanager_secret.app_secret.arn
}