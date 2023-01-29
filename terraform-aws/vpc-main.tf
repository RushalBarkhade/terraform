resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" : "myvpc"
  }
}

resource "aws_subnet" "my_public_subnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    "Name" : "my_public_subnet"
  }
}

resource "aws_internet_gateway" "my_gt" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    "Name" : "my_gt"
  }
}

resource "aws_route_table" "my_public_rt" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    "Name" : "my_public_rt"
  }
}

resource "aws_route" "my_default_route" {
  route_table_id         = aws_route_table.my_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_gt.id
}

resource "aws_route_table_association" "my_public_assoc" {
  subnet_id      = aws_subnet.my_public_subnet.id
  route_table_id = aws_route_table.my_public_rt.id

}

resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  description = "my security group demo"
  vpc_id      = aws_vpc.myvpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" : "my_sg"
  }
}
