terraform {
  backend "s3" {
    bucket = "tf-statefile-lock"
    key    = "test/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "my-dynamo-db-table-tf"
  }
}
