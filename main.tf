terraform {
  required_providers {
    aws = {
      version = "~> 5.52.0"
    }
    random = {
      version = "~> 3.6.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "milo-gha-tf" {
  bucket = "244190102671-camilo-gallego"
  tags = {
    Owner        = "milo"
    bootcamp     = "devops"
  }
}
