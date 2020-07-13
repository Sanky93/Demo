module "nbs_server" {
    source = "../../Modules/ec2/"
    ami                         = var.ami
    inst_type                   = var.inst_type
    subnet_id                   = "${aws_subnet.public-sub.id}"
    vpc_security_group_ids      = ["${aws_security_group.sgrp1.id}"]
    key_name                    = "Actimize"
    customer                    = var.customer
    INSTANCE_PASSWORD           = jsondecode(data.aws_secretsmanager_secret_version.ec2_password_value.secret_string) ["Password_nbs"]
    nameofinstance              = var.nameofinstance
}

resource "aws_key_pair" "key" {
  key_name = "Actimize_nbs"
  public_key = "${file("${var.key_path}")}"
  tags = {
    actimize        = "actimize"
  }
}