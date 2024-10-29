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

# Proveedor de AWS
# provider "aws" {
#   region = "us-east-1"
# }

# Proveedor de MongoDB Atlas
provider "mongodbatlas" {
  public_key  = var.mongodb_atlas_public_key
  private_key = var.mongodb_atlas_private_key
}

# Proveedor de Grafana (con credenciales API y URL)
provider "grafana" {
  auth = var.grafana_auth
  url  = var.grafana_url
}

# Módulo de Grafana
module "grafana_resources" {
  source = "./modules/grafana"
  
  providers = {
    grafana = grafana
  }
}



# Módulo de MongoDB
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

# Módulo de la aplicación web (React)
# module "web_app" {
#   source = "./modules/web_app"
#   
#   app_bucket_name = var.react_app_bucket_name
#   environment     = var.environment
# }

# Módulo de la aplicación móvil (Flutter)
# module "mobile_app" {
#   source = "./modules/mobile_app"
#   
#   app_bucket_name = var.flutter_app_bucket_name
#   environment     = var.environment
# }

# Módulo del host Docker
# module "docker_host" {
#   source = "./modules/docker_host"
#   
#   environment   = var.environment
#   key_name      = var.ec2_key_name
#   backend_images = [
#     "josueamayatorres/api",
#     "palbertt/automatizacion"
#   ]
# }
