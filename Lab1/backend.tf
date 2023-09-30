terraform {
  backend "s3" {
    bucket = "tf-state-iti-ziad"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-state-lock"
  }
}
