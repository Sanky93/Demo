

variable "inst_type"{
default="t2.micro"
}


variable "ami"{
default="ami-0f7122ac3de6f22b2"
}



variable "key_name" {

}

variable "subnet_id" {

}

variable "vpc_security_group_ids" {
        type = "list"

}

variable "customer" {

}

variable "INSTANCE_USERNAME" { default = "admin" } 
variable "INSTANCE_PASSWORD" { }

variable "nameofinstance" {
    
}

# variable "Softwares" {

# }