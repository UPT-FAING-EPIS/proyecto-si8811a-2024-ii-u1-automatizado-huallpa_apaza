# DIAGRAMA

En esta rama se genera los diagramas de infraestructura del repositorio proyecto-si8811a-2024-ii-u1-desarrollo-api-back y develop la Rama donde están los archivos TF.

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

## Archivos Terraform Analizados

- terraform_repo/outputs.tf
- terraform_repo/main.tf
- terraform_repo/variables.tf
- terraform_repo/modules/mongodb/outputs.tf
- terraform_repo/modules/mongodb/main.tf
- terraform_repo/modules/mongodb/variables.tf
- terraform_repo/modules/mobile_app/outputs.tf
- terraform_repo/modules/mobile_app/main.tf
- terraform_repo/modules/mobile_app/variables.tf
- terraform_repo/modules/grafana/outputs.tf
- terraform_repo/modules/grafana/main.tf
- terraform_repo/modules/grafana/variables.tf
- terraform_repo/modules/docker_host/outputs.tf
- terraform_repo/modules/docker_host/main.tf
- terraform_repo/modules/docker_host/variables.tf
- terraform_repo/modules/web_app/outputs.tf
- terraform_repo/modules/web_app/main.tf
- terraform_repo/modules/web_app/variables.tf

## Recursos Utilizados
- EC2
- MongoDB
- Grafana
- Aplicaciones Web y Móviles
- API Backend
