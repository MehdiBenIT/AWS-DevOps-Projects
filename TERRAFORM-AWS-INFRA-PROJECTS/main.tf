provider "aws" {
  region="us-east-1"
  profile = "mehdi"
}

resource "aws_instance" "test_tf" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "NextCloud-QuickDeploy-${formatdate("YYYY-MM-DD", timestamp())}"
  }
  
}