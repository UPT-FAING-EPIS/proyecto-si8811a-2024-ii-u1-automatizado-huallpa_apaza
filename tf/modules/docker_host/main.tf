
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

variable "environment" {}
variable "key_name" {}
variable "backend_images" {
  type = list(string)
}


resource "aws_instance" "docker_host" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              amazon-linux-extras install docker
              service docker start
              usermod -a -G docker ec2-user
              ${join("\n", [for i, image in var.backend_images : "docker run -d -p ${8080 + i}:80 ${image}"])}
              EOF

  tags = {
    Name = "DockerHost-${var.environment}"
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http_${var.environment}"
  description = "Allow HTTP inbound traffic"

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 8080
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_${var.environment}"
  }
}