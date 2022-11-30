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
  region  = var.region
}
/* terraform {
  backend "s3" {
    bucket         = "terraform-statte-storage-dev"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-db"
  }
} */
