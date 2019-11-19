resource "aws_iam_role" "LambdaApiRole" {
  name = "LambdaApiRole"
   
  description = "Role for lambda api"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
}
  EOF
  
  tags = {
    tag-key = "tag-vale"
  }
}

# attach policy to created role 
resource "aws_iam_role_policy_attachment" "AWSLambdaBasicExecutionRole-attach" {
  role       = "${aws_iam_role.LambdaApiRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}