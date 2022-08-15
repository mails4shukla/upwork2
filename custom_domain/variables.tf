variable "aws_region" {
  description = "Region for AWS"
  type        = string
}

variable "domain" {
  description = "VPC ID for AWS"
  type        = string
}

variable "api_gateway_lambda"  {
 description = " name of api gateway"
 type = string 
}

variable "api_gateway_http" {
 description = " name of api gateway" 
 type =  string 
}


variable "stage" {
 description = "stage name"
 type = string 
}
