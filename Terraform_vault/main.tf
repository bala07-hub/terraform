provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address          = "http://54.173.216.161:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = "<642e890a-48db-0484-8308-8ce8d7038bde>"
      secret_id = "<bc0d843f-cf9c-6844-65cf-d22954756c39>"
    }
  }
}
data "vault_kv_secret_v2" "example" {
  mount = " kv"
  name  = "test-secret"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
