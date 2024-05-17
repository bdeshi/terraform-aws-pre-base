terraform {
  required_version = "~> 1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "remote" {}
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      "ManagedBy"       = "iac/terraform"
      "iac/environment" = "global"
      "iac/component"   = "pre-base"
      "iac/source"      = "${trimsuffix(var.git_project, "/")}"
    }
  }
}
