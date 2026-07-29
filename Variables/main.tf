resource "aws_instane" "myInstance" {
    ami ="ami-02b64aa047cb5edf5"
    region = "us-east-1"
    instance_type ="t3.micro"

    tags={
        name = local.instance_name
        environment=var.environment
    }
}

variable "instance_name" {
    description ="name of the instance"
    type=string
    default ="myInstance"
}
variable "environment" {
    description ="environment"
    type=string
    default ="testing"
}

locals {
    instance_name = "myInstance"
    environment = "testing"
}

output "instance_id" {
    value= aws_instance.myInstance.id
}