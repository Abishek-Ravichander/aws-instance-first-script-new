resource "aws_instance" "web1" {
   count = 1
   ami           = "ami-035b3c7efe6d061d5"
   instance_type = "t2.micro"
   vpc_security_group_ids = ["sg-010f908f817844c6d"]

 }

provider "aws" {
  region  = "us-east-1"  
  
}

