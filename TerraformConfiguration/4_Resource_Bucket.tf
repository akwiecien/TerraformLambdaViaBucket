resource "aws_s3_bucket" "aws_s3_bucket_id" {
    bucket          = "bucket-used-for-publishing-lambda"
    acl             = "private"
    force_destroy   = "true"
}