data "aws_secretsmanager_secret" "ec2_password_name" {
  name = "Password"
}

data "aws_secretsmanager_secret_version" "ec2_password_value" {
    secret_id = "${data.aws_secretsmanager_secret.ec2_password_name.id}"
}