variable "vpc_cidr"{
default="10.0.0.0/24"
}

variable "INSTANCE_USERNAME" { default = "admin" } 

#variable "INSTANCE_PASSWORD" { }


variable "customer" {
  default = "hsbc"
}

variable "public_subnet_cidr" {

}



variable "inst_type"{
default="t2.micro"
}


variable "ami"{
default="ami-0f7122ac3de6f22b2"
}



variable "key_name" {

}

variable "nameofinstance" {
    
}

variable "vpc_name" {

}

variable "key_path" {
  default = "./Actimize-master/Customer/HSBC/actimize.pub"
}

# variable "Softwares_list"{
#   type = "list"
# }

# variable "map_softwares"{
#   type = map(string)
#   default = {
#     "1" = "npp"
#     "2" = "java"
#   }
# }
