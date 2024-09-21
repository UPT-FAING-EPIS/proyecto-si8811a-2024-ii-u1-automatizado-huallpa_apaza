# Proyecto de API

Este proyecto contiene funciones automatizadas para gestionar la API.

## Diagrama de Infraestructura
```mermaid
graph TD;
    mongodbatlas_project --> AWS
    mongodbatlas_cluster --> AWS
    mongodbatlas_database_user --> AWS
    aws_s3_bucket --> AWS
    aws_s3_bucket_website_configuration --> AWS
    aws_s3_bucket_public_access_block --> AWS
    aws_s3_bucket_policy --> AWS
    grafana_cloud_stack --> AWS
    aws_instance --> AWS
    aws_security_group --> AWS
    aws_s3_bucket --> AWS
    aws_s3_bucket_website_configuration --> AWS
    aws_s3_bucket_public_access_block --> AWS
    aws_s3_bucket_policy --> AWS
```

## Recursos Utilizados
- EC2
- MongoDB
- Grafana
- Aplicaciones Web y Móviles
- API Backend
