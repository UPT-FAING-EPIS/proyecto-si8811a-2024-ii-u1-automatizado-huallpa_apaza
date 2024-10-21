[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/vK6WBQ1t)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=15560937)

# Terraform Infrastructure as Code for Multi-Component Application

Este proyecto utiliza Terraform para desplegar una infraestructura escalable en Azure que soporta una aplicación con componentes móviles (Flutter), web (React) y un backend API.

## Estructura del Proyecto

project/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│ ├── mobile_app/
│ ├── web_app/
│ └── backend_api/
text


## Componentes

- **Aplicación Móvil (Flutter)**: Alojada en Azure Storage con CDN.
- **Aplicación Web (React)**: Alojada en Azure Storage con CDN.
- **Backend API**: Desplegada en Azure Kubernetes Service (AKS).

## Variables Principales

### Globales
- `resource_group_name`: Nombre del grupo de recursos de Azure.
- `location`: Región de Azure donde se desplegarán los recursos.

### Aplicación Móvil (Flutter)
- `flutter_app_storage_account_name`: Nombre de la cuenta de almacenamiento para la app Flutter.

### Aplicación Web (React)
- `react_app_storage_account_name`: Nombre de la cuenta de almacenamiento para la app React.

### Backend API
- `acr_name`: Nombre del Azure Container Registry.
- `aks_cluster_name`: Nombre del cluster de Azure Kubernetes Service.
- `subnet_id`: ID de la subred para el cluster AKS.
- `backend_node_count`: Número de nodos en el cluster AKS.

## Uso

1. Asegúrate de tener Terraform instalado y configurado para trabajar con Azure.
2. Clona este repositorio.
3. Navega al directorio del proyecto.
4. Inicializa Terraform: 
terraform init

5. Revisa el plan de ejecución:
terraform plan

6. Aplica la configuración:
terraform apply


## Notas Importantes

- Asegúrate de tener los permisos necesarios en tu suscripción de Azure.
- Revisa y ajusta las variables en `variables.tf` según tus necesidades específicas.
- Considera usar un backend remoto para el estado de Terraform para facilitar la colaboración.

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request para sugerir cambios o mejoras.

## Diagrama
![WhatsApp Image 2024-08-31 at 5 00 33 PM](https://github.com/user-attachments/assets/e3c8a7ba-7751-4262-bae1-f04646c828ba)
https://github.com/UPT-FAING-EPIS/proyecto-si8811a-2024-ii-u1-automatizado-huallpa_apaza/tree/DesarrolloApiBack

## Licencia

[MIT](https://choosealicense.com/licenses/mit/)

