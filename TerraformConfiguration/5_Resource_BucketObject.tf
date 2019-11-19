resource "aws_s3_bucket_object" "lambda_code_object" {
    key             = "DeployPackage.zip"
    bucket          = "${aws_s3_bucket.aws_s3_bucket_id.id}"
  	source          = "${data.archive_file.lambda_zip.output_path}"
	etag            = "${data.archive_file.lambda_zip.output_base64sha256}"
    force_destroy   = "true"
}