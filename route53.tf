provider "aws" {
  region = "us-east-1"
}



resource "aws_route53_record" "www" {
  allow_overwrite = true
  zone_id = var.zone-id
  name    = "www.devops-accel-test.com"
  type    = "A"
  ttl     = 300
  records = [var.blue-ip]
}


variable "zone-id" {
        default = "Z0589038125I1IDMNOB0D"
        }
 
variable "blue-ip" {
        default = "10.10.10.25"
        }
 
variable "green-ip" {
        default = "10.10.10.21"
        }
