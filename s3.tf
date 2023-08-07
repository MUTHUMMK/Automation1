resource "aws_s3_bucket" "my-aws_s3_bucket" {
    bucket_prefix = var.bucketname
    acl = var.acl

     versioning {
      enabled = var.versioning
    }
  
}
