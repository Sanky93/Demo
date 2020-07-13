data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc"  "sample_vpc"{
cidr_block="${var.vpc_cidr}"
tags = {
    Name = var.vpc_name
    actimize        = "actimize"
  }
}
resource "aws_subnet" "public-sub"{
cidr_block=var.public_subnet_cidr
vpc_id="${aws_vpc.sample_vpc.id}"
availability_zone="eu-west-2a"
tags = {
    actimize        = "actimize"
  }
}

resource "aws_internet_gateway" "igw"{
vpc_id="${aws_vpc.sample_vpc.id}"
tags = {
    actimize        = "actimize"
  }
}

resource "aws_route_table" "rtbl"{
vpc_id="${aws_vpc.sample_vpc.id}"
route{
cidr_block="0.0.0.0/0"
gateway_id="${aws_internet_gateway.igw.id}"
}
tags = {
    actimize        = "actimize"
  }
}

resource "aws_route_table_association" "pubrtbl"{
subnet_id="${aws_subnet.public-sub.id}"
route_table_id="${aws_route_table.rtbl.id}"
}

resource "aws_security_group" "sgrp1"{
name="hsbcsgrp1"
vpc_id="${aws_vpc.sample_vpc.id}"
 ingress{
 from_port=3389
 to_port=3389
 protocol="tcp"
 cidr_blocks=["0.0.0.0/0"]
}
 ingress{
 from_port=5985
 to_port=5985
 protocol="tcp"
 cidr_blocks=["0.0.0.0/0"]
}
   ingress{
 from_port=5986
 to_port=5986
 protocol="tcp"
 cidr_blocks=["0.0.0.0/0"]
}
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    name = "SECURITYGRP1"
    actimize        = "actimize"
}
}




