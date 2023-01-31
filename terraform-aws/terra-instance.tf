resource "aws_instance" "my_ec2" {
  ami           = "ami-06984ea821ac0a879"
  instance_type = "t3.micro"
  /* key_name      = "terraform_key" */
  /* subnet_id              = aws_subnet.my_public_subnet.id */
  /* vpc_security_group_ids = [aws_security_group.my_sg.id] */
  /* user_data              = file("apache_install.sh") */
  count = 5
  tags = {
    "Name" : "my_ec2-${count.index}"
  }

}
