
resource "aws_instance" "my-ec2" {
  ami                         = var.ami_value
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  tags = {
    Name = "my-first-module"
  }
}
