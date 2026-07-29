terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>6.0"
        }
    }
    backend "s3" {
        bucket ="venkatasaivinay-s3-bucket"
        encrypt = true
        key    = "testing/terraform.tfstate"
        use_lockfile = true
        region = "us-east-1"
    }
}

provider "aws" {
    region="us-east-1"
}