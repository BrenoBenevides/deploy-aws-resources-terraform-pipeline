terraform {
  required_providers {
    aws = {source = "hashicorp/aws"
           version = ">1.0.0"
    }

  }

  backend "s3" {
    bucket = "remote-state-terraform-bucket"
    workspace_key_prefix= "terraform-state/terraform-state.tfstate"
  }
}

