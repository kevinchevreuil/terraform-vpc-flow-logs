#Select the provider to using#
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

#Select the region of the cloud provider#
provider "aws" {
  region = var.region
}