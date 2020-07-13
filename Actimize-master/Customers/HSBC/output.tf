output "password_for_ec2"{
    value = data.aws_secretsmanager_secret.ec2_password_name.name
}

output "Secret_value" {
    value = jsondecode(data.aws_secretsmanager_secret_version.ec2_password_value.secret_string) ["Password"]
}

