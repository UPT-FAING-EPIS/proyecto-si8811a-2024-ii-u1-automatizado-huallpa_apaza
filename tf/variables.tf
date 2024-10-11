variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}
variable "mongodb_region" {
  description = "mongodb region to deploy resources"
  type        = string
  default     = "US_WEST_2"
}


variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "react_app_bucket_name" {
  description = "Name of the S3 bucket for React app"
  type        = string
}

variable "flutter_app_bucket_name" {
  description = "Name of the S3 bucket for Flutter app"
  type        = string
}

variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "grafana_instance_type" {
  description = "Instance type for Grafana server"
  type        = string
  default     = "t2.micro"
}

variable "mongodb_project_name" {
  description = "The name of the MongoDB Atlas project"
  type        = string
}

variable "mongodb_atlas_org_id" {
  description = "The organization ID for MongoDB Atlas"
  type        = string
}

variable "mongodb_cluster_name" {
  description = "The name of the MongoDB cluster"
  type        = string
}

variable "mongodb_username" {
  description = "The username for the MongoDB database"
  type        = string
}

variable "mongodb_password" {
  description = "The password for the MongoDB database"
  type        = string
}

variable "mongodb_database_name" {
  description = "The name of the database to create in MongoDB"
  type        = string
}




variable "mongodb_atlas_public_key" {
  description = "mongodb_atlas_public_key"
  type        = string
}
variable "mongodb_atlas_private_key" {
  description = "mongodb_atlas_private_key"
  type        = string
}

variable "grafana_cloud_api_key" {
  description = "grafana_cloud_api_key"
  type        = string
}

variable "ec2_key_name" {
  description = "The key pair name for EC2 instance"
  type        = string
}
