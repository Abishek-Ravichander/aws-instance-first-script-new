resource "aws_instance" "web1" {
   ami           = "ami-035b3c7efe6d061d5"
   instance_type = "t2.micro"
 }

provider "aws" {
  region  = "us-east-1"  
  
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

ingress = [
     {
       cidr_blocks      = ["10.0.0.0/16"]
       from_port        = 22
       protocol         = "tcp"
       to_port          = 22
       description      = "Example"
       ipv6_cidr_blocks = null
       prefix_list_ids  = null
       security_groups  = null
       self             = null
     }
  ]

  egress = [
     {
       cidr_blocks      = ["10.0.0.0/16"]
       from_port        = 0
       protocol         = "-1"
       to_port          = 0
       description      = "Example"
       ipv6_cidr_blocks = null
       prefix_list_ids  = null
       security_groups  = null
       self             = null
     }
  ]
}
