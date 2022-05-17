resource "aws_s3_bucket" "s3_bucket" {
  bucket = "data-received-ec2-${terraform.workspace}"
  tags = { Created-by = "Terraform"
    Usage = "Manage Terraform states"

  }
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true

  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}