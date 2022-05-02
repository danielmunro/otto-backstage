resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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
}

resource "aws_lambda_function" "lambda_function" {
  function_name           = "${var.project}-lambda-function"
  handler                 = "index.handler"
  runtime                 = "nodejs14.x"
  role                    = aws_iam_role.iam_for_lambda.arn
  package_type            = "Image"
  image_uri               = "449308125355.dkr.ecr.us-west-2.amazonaws.com/otto-backstage:ba8f5c2e8dc2205dc1c02d8440bf2231a92e17f4"
  vpc_config {
    subnet_ids         = [var.public_subnet_id]
    security_group_ids = [var.security_group_id]
  }
}

resource "aws_iam_role_policy_attachment" "AWSLambdaVPCAccessExecutionRole" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}
