terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~>6.0"
        }
    }
}

resource "aws_s3_bucket" "myBucket" {
    region ="us-east-1"
    bucket ="venkatasaivinay-s3-bucket"
    # acl    = "private"
    tags ={
        Name="venkatasaivinay-s3-bucket"
        environment="Dev"
    }
}
resource "aws_s3_bucket_versioning" "versioning" {
        bucket = aws_s3_bucket.myBucket.id
        versioning_configuration {
            status ="Enabled"
        }
}