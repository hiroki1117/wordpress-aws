output "mysqlendpoint" {
    value = resource.aws_db_instance.db.endpoint
}
