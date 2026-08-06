variable "instanes" {
    description = "name of the instances"
    type =list(string)
    default = ["instance-1","instance-2"]
}

variable "buckets" {
    description = "name of the buckets"
    type =set(string)
    default = ["bucket-1","bucket-2"]
}