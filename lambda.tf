resource "aws_lambda_function" "custom_authorizer" {
  count            = var.lambda_package_path != null && var.lambda_entrypoint != "" ? 1 : 0
  filename         = var.lambda_package_path
  function_name    = "${var.rest_api_name}-auth-lambda"
  role             = aws_iam_role.authorizer_lambda_exec[0].arn
  handler          = var.lambda_entrypoint // Entrypoint
  runtime          = var.lambda_runtime
  source_code_hash = filebase64sha256(var.lambda_package_path)

  tags = local.tags

  depends_on = [aws_cloudwatch_log_group.lambda_log_group]
}
