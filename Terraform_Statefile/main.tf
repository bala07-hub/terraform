resource "aws_instance" "my-ec2" {
  ami           = var.ami_value
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = var.name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  attribute {
    name = "LockID"
    type = "S"
  }

}
