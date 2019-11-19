resource "aws_lambda_function" "TerraformLambdaViaBucket" {
    function_name     = "TerraformLambdaViaBucket"
    handler           = "app.lambda_handler"
    runtime           = "python3.7"
    timeout           = "30"
    memory_size       = 512
    role              = "${aws_iam_role.LambdaApiRole.arn}"
    # insted of filename parameter you have to provide s3_bucket and s3_key
    s3_bucket         = "${aws_s3_bucket.aws_s3_bucket_id.id}"
    s3_key            = "${aws_s3_bucket_object.lambda_code_object.key}"

  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
}