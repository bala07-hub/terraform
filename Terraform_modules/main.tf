provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami_value     = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e1ebca0aa3ccf4de"
}
