variable "region" {
   description = "region"
   type = string 
}

variable "lb_endpoint" {
  description = "Region for AWS"
  type        = string
}
 
variable "api_gateway_http" {
   description = "Name of  gateway"
   type  = string 
}

variable "stage" {
   description = "Stage Name"
   type = string 
}
