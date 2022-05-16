variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
    default = "ap-northeast-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_ley = "${var.aws_secret_key}"
  region = "${var.region}"
}
