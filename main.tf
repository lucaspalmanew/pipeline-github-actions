terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.6.2"
    }
  }

  backend "s3" {
    bucket = "bucketlucaspalma-terraform12"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "lucaspalma"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "lucaspalma-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

