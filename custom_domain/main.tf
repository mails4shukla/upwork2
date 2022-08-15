
data "aws_acm_certificate" "issued" {
  domain   = var.domain
  statuses = ["ISSUED"]
}

data "aws_api_gateway_rest_api" "lambda" {
  name = var.api_gateway_lambda
}

data "aws_api_gateway_rest_api" "http" {
  name = var.api_gateway_http
}



resource "aws_api_gateway_domain_name" "example" {
  certificate_arn = data.aws_acm_certificate.issued.arn
  domain_name     = var.domain
}

resource "aws_api_gateway_base_path_mapping" "example" {
  api_id      = data.aws_api_gateway_rest_api.lambda.id
  stage_name  = var.stage
  domain_name = var.domain
  base_path   = "v1" 
}


resource "aws_api_gateway_base_path_mapping" "example1" {
  api_id      = data.aws_api_gateway_rest_api.http.id
  stage_name  = var.stage
  domain_name = var.domain
  base_path   = "v2"
}
