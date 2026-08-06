# count {used for list}
# for_each {used when we are having set, map variable to create resources}
# depends_on {used to create resources based on the dependency of other resources}

resource "aws_instance" "myInstance" {
    count = length(var.instanes)
    ami= "0bdc7d025135d7b49"
    instance_type= "t3.micro"
    key_name= "aws_login"
    root_block_device {
        volume_size = 8
    }

    tags=var.tags

    depends_on = aws_s3_bucket.myBucket
}

resource "aws_s3_bucket" "myBucket" {
    for_each = var.buckets
    bucket =each.value
}

