terraform {
  required_providers {
    aws = {
      version = "~> 5.52.0"
    }
    random = {
      version = "~> 3.6.2"
    }
  }
  backend "s3" {
    bucket = "draconreyal-bucket"
    key    = "terraform/state.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "milo-gha-tf" {
  bucket = "draconreyal-bucket"
  tags = {
    Owner        = "milo"
    bootcamp     = "devops"
  }
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "draconreyal-bucket"
}

resource "aws_dynamodb_table" "tf_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


