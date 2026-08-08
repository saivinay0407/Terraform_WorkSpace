# generate example for the data source for vpc, subnet and create new ec2 instances with those resources
data "aws_vpc" "loadVpc" {
    filter {
        name   = "tag:Name"
        values = ["default_vpc"]
    }
}

data "aws_subnet" "loadSubnet" {
    filter {
        name   = "tag:Name"
        values = ["subnetA"]
    }
    vpc_id = data.aws_vpc.loadVpc.id
}

resource "aws_instance" "example" {
    ami           = "ami-0bdc7d025135d7b49" # Example AMI ID, replace with a valid one
    instance_type = "t2.micro"
    subnet_id     = data.aws_subnet.loadSubnet.id
    tags = {
        Name = "ExampleInstance"
    }
}