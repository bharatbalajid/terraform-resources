terraform {
  required_providers {
    # AWS Provider
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.41"
    }
  }
}
#provider for us-east-1 region
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
