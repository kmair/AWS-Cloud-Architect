provider "aws" {

  region = var.region

}


resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_role.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt1592798569942",
        "Action": "logs:*",
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = <<-EOF
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


locals {
  lambda_zip_location = "outputs/greet_lambda.zip"
}

data "archive_file" "greet_lambda" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = "${local.lambda_zip_location}"
}


resource "aws_lambda_function" "greet_lambda" {
  filename      = "${local.lambda_zip_location}"
  function_name = "greet_lambda"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "greet_lambda.lambda_handler"

  # source_code_hash = "${filebase64sha256("greet_lambda.zip")}"

  runtime = "python3.7"
  
  environment {
    variables = {
    greeting = "Hi!"
    }
  }

}

resource "aws_lambda_permission" "CloudWatchLogs" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.greet_lambda.function_name}"
  principal = "events.amazonaws.com"
  source_arn = "${aws_lambda_function.greet_lambda.arn}"
}

