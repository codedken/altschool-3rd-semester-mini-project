# Create the 3 instances 
resource "aws_instance" "app1" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_pair
  security_groups = [aws_security_group.allow-web.id]
  subnet_id       = aws_subnet.subnet-1.id


  tags = {
    Name = "${var.project_name}-app1"
  }
}
resource "aws_instance" "app2" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_pair
  security_groups = [aws_security_group.allow-web.id]
  subnet_id       = aws_subnet.subnet-2.id


  tags = {
    Name = "${var.project_name}-app2"
  }
}
resource "aws_instance" "app3" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_pair
  security_groups = [aws_security_group.allow-web.id]
  subnet_id       = aws_subnet.subnet-3.id


  tags = {
    Name = "${var.project_name}-app3"
  }
}

# Create a host-inventory file and put the instances' public ip addresses in it
resource "local_file" "first_output" {
  filename = "ansible-playbook/host-inventory"
  content  = <<-EOT
${aws_instance.app1.public_ip}
${aws_instance.app2.public_ip}
${aws_instance.app3.public_ip}
EOT
}

