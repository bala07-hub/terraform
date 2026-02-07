variable "ami_value" {
  description = "ami-value of ec2 instance"

}

variable "instance_type" {
  description = "instance type of ec2 instance"

}

variable "subnet_id" {
  description = "subnet_id of ec2 instance"
}

variable "s3_bucket" {
  description = "this is s3 bucket name"
}

variable "name" {
  description = "dyanmo table name"
}
variable "billing_mode" {
  description = "billing mode for dynamo db"
}
variable "hash_key" {
  description = "hash key for dynamo db"
}
