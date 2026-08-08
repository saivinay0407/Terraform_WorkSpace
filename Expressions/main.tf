# terrafrm expressions

# conditional expressions where we check condition and return a value based on that condition eg: instance_type= env=='dev'?"t2.micro" : "t3.micro"

# dynamic blocks are used when we want to create multiple blocks of the same type based on a variable or a list. For example, if we have a list of security group rules, we can use a dynamic block to create multiple security group rule blocks based on that list.

# splat expressions are used to extract values from complex data structures like maps and lists. For example, if we have a map of instance types and their corresponding AMIs, we can use a splat expression to get the AMI for a specific instance type.

resource "aws_instance" "myInstance" {
    ami = var.ami
    instance_type= var.environment=="dev" ? "t3.micro" : "t3.small"
    tags = var.tags
}

resource "aws_security_group" "mySG" {
    name = "mySG"

    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port = ingress.value.from_port
            to_port = ingress.value.to_port
            protocol = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
        }
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}