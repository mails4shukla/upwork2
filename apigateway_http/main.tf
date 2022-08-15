
resource "aws_api_gateway_rest_api" "api" {
 name = var.api_gateway_http
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  parent_id   = "${aws_api_gateway_rest_api.api.root_resource_id}"
  path_part   = "{proxy+}"
}
resource "aws_api_gateway_method" "method" {
  rest_api_id   = "${aws_api_gateway_rest_api.api.id}"
  resource_id   = "${aws_api_gateway_resource.resource.id}"
  http_method   = "ANY"
  authorization = "NONE"
  request_parameters = {
    "method.request.path.proxy" = true
  }
}
resource "aws_api_gateway_integration" "integration" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  resource_id = "${aws_api_gateway_resource.resource.id}"
  http_method = "${aws_api_gateway_method.method.http_method}"
  integration_http_method = "ANY"
  type                    = "HTTP_PROXY"
  uri                     = var.lb_endpoint
 
  request_parameters =  {
    "integration.request.path.proxy" = "method.request.path.proxy"
  }
}




resource "aws_api_gateway_deployment" "example" {

depends_on = [
    aws_api_gateway_integration.integration,
  ]
rest_api_id = aws_api_gateway_rest_api.api.id


  lifecycle {
    create_before_destroy = true
  }

  stage_name = var.stage
}

