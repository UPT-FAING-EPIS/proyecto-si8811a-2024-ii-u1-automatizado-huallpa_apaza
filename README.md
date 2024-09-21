# Proyecto de API

Este proyecto contiene funciones automatizadas para gestionar la API.

## Diagrama de Infraestructura
```mermaid
graph TD;
    "mongodbatlas_project"
"mongodbatlas_cluster"
"mongodbatlas_database_user" --> AWS
    "aws_s3_bucket"
"aws_s3_bucket_website_configuration"
"aws_s3_bucket_public_access_block"
"aws_s3_bucket_policy" --> AWS
    "grafana_cloud_stack" --> AWS
    "aws_apigatewayv2_api"
"aws_apigatewayv2_stage"
"aws_apigatewayv2_route"
"aws_apigatewayv2_integration" --> AWS
    "aws_s3_bucket"
"aws_s3_bucket_website_configuration"
"aws_s3_bucket_public_access_block"
"aws_s3_bucket_policy" --> AWS
```

## Recursos Utilizados
- EC2
- MongoDB
- Grafana
- Aplicaciones Web y Móviles
- API Backend
