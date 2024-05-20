output "mysql_instance_id" {
    value = aws_instance.mysql.id
}

output "mysql_instance_public_ip" {
    value = aws_instance.mysql.public_ip
}
