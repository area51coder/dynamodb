provider "aws" {
region = "us-east-2"
}

resource "aws_dynamodb_table" "terraform_locks" {
name = "terraform-up-and-running-locks"
billing_mode = "PAY_PER_REQUEST"
hash_key = "LockID"
attribute {
name = "LockID"
type = "S"
}
}
terraform {
backend "s3" {
# Replace this with your bucket name!
bucket = "terraform-up-and-running-state-area51"
key = "global/s3/terraform.tfstate"
region = "us-east-2"
# Replace this with your DynamoDB table name!
dynamodb_table = "terraform-up-and-running-locks"
encrypt = true
}
}
