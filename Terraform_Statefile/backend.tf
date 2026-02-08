terraform {
  backend "s3" {
    bucket         = "bala-s3-demo-test1"
    region         = "us-east-1"
    key            = "bala/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
