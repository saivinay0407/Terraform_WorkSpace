# lifecyclerules
# create_before_destroy = true {crate new resource before destroying the old resource}
# prevent_destroy = true {prevents the resource from being destroyed}
# ignore_changes = [tags] {ignores the changes in the tags attribute of the resource}
# replace_triggered_by =  {replaces the resource when the specified resource is replaced}
# postcondition {used to check the condition after the resource is created}
# precondition {used to check the condition before the resource is created}

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

    lifecycle {
        create_before_destroy =true
        # create_before_destroy =false
    }
}

resource "aws_s3_bucket" "myBucket" {
    for_each = var.buckets
    bucket =each.value

    lifecycle {
        prevent_destroy =true
    }

    lifecycle {
        replace_triggered_by = [aws_instance.myInstance]
    }

    lifecycle{
        postcondition{
            condition=contains(keys(var.tags), "compliance")
            error_message="compliance tag is missing"
        }
    }
}

