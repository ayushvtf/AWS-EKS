provider "aws" {
  version = ">= 2.68.0"
  #access_key = ""
  #secret_key = ""
  region     = "us-east-2"
}

provider "random" {
  version = "~> 2.2.1"
}


data "aws_caller_identity" "current" {} # used for accesing Account ID and ARN
