/* resource "aws_s3_bucket" "a" {
  bucket = "onaivi-okuta0"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "My bucket0"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "onaivi-okuta1"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "My bucket1"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "c" {
  bucket = "onaivi-okuta3"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "My bucket3"
    Environment = "Dev"
  }
} */

/* resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls   = true
  block_public_policy = true
}  */

/* resource "aws_s3_bucket_public_access_block" "main" {
    for_each = toset(local.bucket_list)
    bucket = each.key
    block_public_acls = true 
    block_public_policy = true 
    ignore_public_acls = true 
    restrict_public_buckets = true
}

locals {
    bucket_list = [
        aws_s3_bucket.a.id,
        aws_s3_bucket.b.id,
        aws_s3_bucket.c.id
    ]
} */