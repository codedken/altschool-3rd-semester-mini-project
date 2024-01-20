output "first_output" {
  value = aws_instance.app1.public_ip
}
output "second_output" {
  value = aws_instance.app2.public_ip
}
output "third_output" {
  value = aws_instance.app3.public_ip
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "elb_load_balancer_dns_name" {
  value = aws_lb.my_load_balancer.dns_name
}



