resource "aws_db_instance" "mydb" {
  allocated_storage   = 5
  engine              = "mysql"
  db_name                = "mydbsql"
  instance_class      = "db.t2.micro"
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}