#! /bin/bash
echo "Updating the system"
sudo yum update -y
echo "installing apache"
sudo yum install -y httpd
echo "Starting apache server"
sudo service httpd start  
sudo systemctl enable httpd
echo "<h1>Welcome to Blue-Dev-App ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html