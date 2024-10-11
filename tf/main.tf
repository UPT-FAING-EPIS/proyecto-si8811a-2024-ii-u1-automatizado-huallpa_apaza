terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.0"
    }
    grafana = {
      source  = "grafana/grafana"
      version = "~> 1.28.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "mongodbatlas" {
  public_key  = var.mongodb_atlas_public_key
  private_key = var.mongodb_atlas_private_key
}

provider "grafana" {
  cloud_api_key = var.grafana_cloud_api_key
}

module "grafana_resources" {
  source = "./modules/grafana"
  
  providers = {
    grafana = grafana
  }
}

module "mongodb" {
  source = "./modules/mongodb"

  providers = {
    mongodbatlas = mongodbatlas
  }

  project_name  = var.mongodb_project_name
  atlas_org_id  = var.mongodb_atlas_org_id
  cluster_name  = var.mongodb_cluster_name
  region        = var.mongodb_region
  db_username   = var.mongodb_username
  db_password   = var.mongodb_password
  database_name = var.mongodb_database_name
}

module "web_app" {
  source = "./modules/web_app"
  
  app_bucket_name = var.react_app_bucket_name
  environment     = var.environment
}

module "mobile_app" {
  source = "./modules/mobile_app"
  
  app_bucket_name = var.flutter_app_bucket_name
  environment     = var.environment
}

module "docker_host" {
  source = "./modules/docker_host"
  
  environment = var.environment
  key_name    = var.ec2_key_name
  backend_images = [
    "josueamayatorres/api:v1",
    "palbertt/automatizacion:api2-v1.0.0"
  ]
}