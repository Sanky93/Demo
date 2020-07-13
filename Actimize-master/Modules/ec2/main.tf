resource "aws_instance" "pubserver1" {
  ami                         = "${var.ami}"
  instance_type               = "${var.inst_type}"
  subnet_id                   = var.subnet_id
  user_data                   = "${data.template_file.userdata_win.rendered}"
  vpc_security_group_ids      = "${var.vpc_security_group_ids}"
  key_name                    = var.key_name
  associate_public_ip_address = "true"
  tags = {
        Name  =  "${var.nameofinstance}"
        actimize        = "actimize"
    }
}

#for softwares in var.Softwares:
