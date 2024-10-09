terraform { 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.10.0"
    }
    grafana = {
      source  = "grafana/grafana"
      version = "~> 1.28.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "mongodbatlas" {
  public_key  = var.mongodb_atlas_public_key
  private_key = var.mongodb_atlas_private_key
}

provider "grafana" {
  cloud_api_key = var.grafana_cloud_api_key
}

# Recursos de Grafana
resource "grafana_cloud_stack" "my_stack" {
  name        = "hc2020067571"
  slug        = "hc2020067571"
  region_slug = "us"
}

# MongoDB Atlas
resource "mongodbatlas_project" "project" {
  name   = var.mongodb_project_name
  org_id = var.atlas_org_id
}

resource "mongodbatlas_cluster" "cluster" {
  project_id = mongodbatlas_project.project.id
  name       = var.cluster_name
  provider_name               = "TENANT"
  backing_provider_name       = "AWS"
  provider_region_name        = var.mongodb_region
  provider_instance_size_name = "M0"

  lifecycle {
    ignore_changes = all
  }
}

resource "mongodbatlas_database_user" "user" {
  username           = var.db_username
  password           = var.db_password
  project_id         = mongodbatlas_project.project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = var.database_name
  }
}

# Web App (React)
resource "aws_s3_bucket" "react_app_bucket" {
  bucket = var.react_app_bucket_name
}

resource "aws_s3_bucket_website_configuration" "react_app_website" {
  bucket = aws_s3_bucket.react_app_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "react_app_public_access" {
  bucket = aws_s3_bucket.react_app_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "react_app_bucket_policy" {
  bucket = aws_s3_bucket.react_app_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.react_app_bucket.arn}/*"
      },
    ]
  })
}

# Mobile App (Flutter)
resource "aws_s3_bucket" "flutter_app_bucket" {
  bucket = var.flutter_app_bucket_name
}

resource "aws_s3_bucket_website_configuration" "flutter_app_website" {
  bucket = aws_s3_bucket.flutter_app_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "flutter_app_public_access" {
  bucket = aws_s3_bucket.flutter_app_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "flutter_app_bucket_policy" {
  bucket = aws_s3_bucket.flutter_app_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.flutter_app_bucket.arn}/*"
      },
    ]
  })
}

# Docker Host
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "docker_host" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.ec2_key_name

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
