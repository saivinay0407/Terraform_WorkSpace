output "instances_ids" {
    value = aws_instance.myInstance[*].id
}