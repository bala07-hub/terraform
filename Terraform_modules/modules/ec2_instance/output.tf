output "public-ip-address" {
  value = aws_instance.my-ec2.public_ip
}
