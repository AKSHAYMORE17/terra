resource "aws_db_subnet_group" "database_subnet_group" {
    name = "database-subnet-group"
    subnet_ids = [ var.private_sub5_id, var.private_sub6_id ]
}

resource "aws_db_instance" "database_instance" {
    identifier             = "mydbinstance"
    allocated_storage      = 20
    storage_type           = var.rds_storage_type
    engine                 = var.rds_engine_name
    engine_version         = var.rds_db_engine_version
    instance_class         = var.rds_instance_type
    db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
    username               = var.rds_username
    password               = var.rds_password
    port                   = 3306
    publicly_accessible    = false
    vpc_security_group_ids = [aws_security_group.db_instance_sg.id]
    skip_final_snapshot = false
    tags = {
        Name = "db-Database-instance"
    }
}