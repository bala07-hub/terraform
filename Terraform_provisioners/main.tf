//key-pair for ec2
resource "aws_key_pair" "example" {
  key_name   = "terraform-provisioner-demo"
  public_key = file("~/Devops/Terraform/Terraform_provisioners/public_privatekey.pub")
}
//vpc creation
resource "aws_vpc" "my-vpc" {
  cidr_block = var.cidr
}
//public subnet creation
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
}
//Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "webSg" {
  name   = var.aws_sg_tagname
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = var.aws_inbound1_fromport
    to_port     = var.aws_inbound1_toport
    protocol    = var.aws_inbound1_protocal
    cidr_blocks = var.aws_inbound1_cidrblocks
  }
  ingress {
    description = "SSH"
    from_port   = var.aws_inbound2_fromport
    to_port     = var.aws_inbound1_toport
    protocol    = var.aws_inbound2_protocal
    cidr_blocks = var.aws_inbound2_cidrblocks
  }

  egress {
    from_port   = var.aws_outbound_fromport
    to_port     = var.aws_outbound_toport
    protocol    = var.aws_outbound_protocal
    cidr_blocks = var.aws_outbound_cidrblocks
  }

  tags = {
    Name = var.aws_sg_tag
  }
}

resource "aws_instance" "server" {
  ami                    = var.aws_ec2_ami
  instance_type          = var.aws_ec2_instanceType
  key_name               = aws_key_pair.example.key_name
  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id              = aws_subnet.subnet1.id

  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = var.pvt_key_passphrase
    private_key = file("~/Devops/Terraform/Terraform_provisioners/public_privatekey") # path to private key
    host        = self.public_ip
  }

  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py" # Replace with the path on the remote instance
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",                  # Update package lists (for ubuntu)
      "sudo apt-get install -y python3-pip", # Example package installation
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 app.py &",
    ]
  }
}
