terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}