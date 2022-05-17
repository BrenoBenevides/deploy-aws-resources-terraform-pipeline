terraform {
  required_providers {
    aws = { source = "hashicorp/aws"
      version = ">1.0.0"
    }

  }


    backend "s3" {
      bucket = "terraform-remote-state-project"
      workspace_key_prefix= "environments"
      region = "us-west-2"
      key = "terraform_state.tfstate"
    }
}

provider "aws" {
  region = "us-west-2"

}

#resource "aws_s3_bucket" "backend_bucket" {
#  bucket = "terraform-remote-state-project"
#  lifecycle {prevent_destroy = true}
#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        sse_algorithm = "AES256"
#      }
#    }
#  }
#  versioning {enabled = true}
#}

