terraform {
  backend "s3" {
    bucket         = "bala-s3-demo"
    key            = "bala/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
