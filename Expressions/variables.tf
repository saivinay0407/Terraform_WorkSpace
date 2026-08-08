variable "ami" {
    description = "AMI ID for the instance"
    type = string
    default = "ami-0bdc7d025135d7b49"
}

variable "environment" {
    description = "Environment for the instance"
    type = string
    default = "dev"
}

variable "tags" {
    description = "Tags for the instance"
    type = map(string)
    default = {
        Name = "MyInstance"
        Environment = "dev"
    }
}

variable "ingress_rules" {
    description = "List of ingress rules"
    type = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
    }))
    default = [
        {
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}