resource "aws_secretsmanager_secret" "app_secret" {
  name = "devops-app-secret-${terraform.workspace}"

  tags = {
    Name = "devops-app-secret-${terraform.workspace}"
  }
}

resource "aws_secretsmanager_secret_version" "app_secret_value" {
  secret_id = aws_secretsmanager_secret.app_secret.id

  secret_string = jsonencode({
    DB_PASSWORD = var.db_password
  })
}