# DIAGRAMAS 

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
## Diagrama de Estructura de Archivos
```mermaid
graph TD;
    Root --> terraform_repo
    terraform_repo --> .git
    .git --> info
    .git --> branches
    .git --> logs
    logs --> refs
    refs --> remotes
    remotes --> origin
    refs --> heads
    .git --> hooks
    .git --> refs
    refs --> remotes
    remotes --> origin
    refs --> heads
    refs --> tags
    .git --> objects
    objects --> info
    objects --> 3c
    objects --> 0c
    objects --> 19
    objects --> f7
    objects --> da
    objects --> 60
    objects --> 74
    objects --> 5e
    objects --> 50
    objects --> d0
    objects --> eb
    objects --> pack
    objects --> 99
    objects --> 53
    objects --> 21
    objects --> 80
    objects --> e6
    objects --> 9b
    objects --> 56
    objects --> 15
    objects --> f2
    objects --> 0d
    objects --> ff
    objects --> f0
    objects --> de
    objects --> f4
    terraform_repo --> modules
    modules --> mongodb
    modules --> mobile_app
    modules --> grafana
    modules --> docker_host
    modules --> web_app
    terraform_repo --> outputs.tf
    terraform_repo --> main.tf
    terraform_repo --> variables.tf
    mongodb --> outputs.tf
    mongodb --> main.tf
    mongodb --> variables.tf
    mobile_app --> outputs.tf
    mobile_app --> main.tf
    mobile_app --> variables.tf
    grafana --> outputs.tf
    grafana --> main.tf
    grafana --> variables.tf
    docker_host --> outputs.tf
    docker_host --> main.tf
    docker_host --> variables.tf
    web_app --> outputs.tf
    web_app --> main.tf
    web_app --> variables.tf
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
