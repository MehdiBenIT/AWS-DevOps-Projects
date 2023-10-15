provider "aws" {
  region="us-east-1"
  profile = "mehdi"
}

resource "aws_instance" "test_tf" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name = "asfar_key.pem"

  tags = {
    Name = "NextCloud-QuickDeploy-${formatdate("YYYY-MM-DD", timestamp())}"
  }
  
}

#
#resource "aws_security_group" "WEB_SG" {
  
#}