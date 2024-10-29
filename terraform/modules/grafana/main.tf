terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 1.28.0"
    }
  }
}

# Crear la carpeta para todos los dashboards
resource "grafana_folder" "monitoreo_topicos" {
  title = "monitoreo-topicos"
}

# Configuración de la pila de Grafana Cloud
resource "grafana_cloud_stack" "my_stack" {
  name        = "jh2021071085"
  slug        = "jh2021071085"
  region_slug = "us"
}

# Dashboard para Docker Host
resource "grafana_dashboard" "docker_host_dashboard" {
  config_json = file("C:/Users/OVALTECH/OneDrive - UNIVERSIDAD PRIVADA DE TACNA/Documentos/GitHub/proyecto-si8811a-2024-ii-u1-automatizado-huallpa_apaza/terraform/modules/grafana/docker_host_dashboard.json")
  folder      = grafana_folder.monitoreo_topicos.id
}

# Dashboard para Grafana Interno
resource "grafana_dashboard" "grafana_internal_dashboard" {
  config_json = file("C:/Users/OVALTECH/OneDrive - UNIVERSIDAD PRIVADA DE TACNA/Documentos/GitHub/proyecto-si8811a-2024-ii-u1-automatizado-huallpa_apaza/terraform/modules/grafana/grafana_internal_dashboard.json")
  folder      = grafana_folder.monitoreo_topicos.id
}

# Dashboard para Mobile App (Flutter)
resource "grafana_dashboard" "mobile_app_dashboard" {
  config_json = file("C:/Users/OVALTECH/OneDrive - UNIVERSIDAD PRIVADA DE TACNA/Documentos/GitHub/proyecto-si8811a-2024-ii-u1-automatizado-huallpa_apaza/terraform/modules/grafana/mobile_app_dashboard.json")  
  folder      = grafana_folder.monitoreo_topicos.id
}

# Conexión a MongoDB como data source en Grafana
resource "grafana_data_source" "mongodb" {
  name       = "MongoDB"
  type       = "mongodb"
  url        = "<mongodb_url>"
  is_default = false

  json_data_encoded = jsonencode({
    database = "prueba1"
    auth_type = "none"
  })
}

# Dashboard para MongoDB
resource "grafana_dashboard" "mongodb_dashboard" {
  config_json = file("C:/Users/OVALTECH/OneDrive - UNIVERSIDAD PRIVADA DE TACNA/Documentos/GitHub/proyecto-si8811a-2024-ii-u1-automatizado-huallpa_apaza/terraform/modules/grafana/mongodb_dashboard.json")  
  folder      = grafana_folder.monitoreo_topicos.id
}

# Dashboard para Web App (React)
resource "grafana_dashboard" "web_app_dashboard" {
  config_json = file("C:/Users/OVALTECH/OneDrive - UNIVERSIDAD PRIVADA DE TACNA/Documentos/GitHub/proyecto-si8811a-2024-ii-u1-automatizado-huallpa_apaza/terraform/modules/grafana/web_app_dashboard.json")
  folder      = grafana_folder.monitoreo_topicos.id
}
