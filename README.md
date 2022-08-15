# upwork2

Run in the following order 
1.apigateway_http
2.apigateway_lambda
3.acm_validation
    ---> After running the acm_validation module please create  the CNAME in the dns for validatiton 
4.custom_domain
    ----> After running the custom_domian module please create  the CNAME in the dns to point end point to cloudfront url
                    eg api.domain.com ---> cloudfront.net

