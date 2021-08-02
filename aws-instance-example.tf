resource "aws_instance" "web1" {
   count = 1
   ami           = "ami-035b3c7efe6d061d5"
   instance_type = "t2.micro"    
 }

provider "aws" {
  region  = "us-east-1"  
  
}

resource "aws_security_group" "example" {
  name        = "allow_tls_1"
  description = "Allow TLS inbound traffic"
  

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }  
}




