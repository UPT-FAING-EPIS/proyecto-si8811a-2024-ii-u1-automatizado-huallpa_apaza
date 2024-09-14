[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/vK6WBQ1t)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=15560953)1

# CI/CD Pipeline for .NET API

Este repositorio contiene un pipeline de CI/CD automatizado para la construcción, prueba y despliegue de una API .NET utilizando GitHub Actions.

## Tabla de Contenidos

- [Descripción](#descripción)
- [Requisitos Previos](#requisitos-previos)
- [Estructura del Pipeline](#estructura-del-pipeline)
  - [Build](#build)
  - [Deploy](#deploy)
- [Configuración de Secretos](#configuración-de-secretos)
- [Cómo Funciona](#cómo-funciona)
- [Cómo Ejecutar el Pipeline](#cómo-ejecutar-el-pipeline)
- [Contribuciones](#contribuciones)

## Descripción

Este pipeline se activa automáticamente cuando se realiza un push a la rama `ApiFuncion` de este repositorio (`proyecto-si8811a-2024-ii-u1-automatizado-huallpa_apaza`). El pipeline realiza las siguientes tareas:

1. Clona el repositorio actual y otro repositorio donde se encuentra el `Dockerfile` y el archivo de proyecto `.csproj`.
2. Restaura las dependencias y construye la aplicación .NET.
3. Ejecuta las pruebas de la aplicación.
4. Construye una imagen Docker utilizando el `Dockerfile` del otro repositorio.
5. Sube la imagen Docker a Docker Hub.
6. Despliega la imagen Docker en un contenedor.

## Requisitos Previos

- Tener una cuenta en [Docker Hub](https://hub.docker.com/).
- Configurar los secretos necesarios en el repositorio de GitHub:
  - `GITHUB_TOKEN`: Token de acceso para realizar operaciones entre los repositorios.
  - `DOCKER_HUB_USERNAME`: Nombre de usuario de Docker Hub.
  - `DOCKER_HUB_ACCESS_TOKEN`: Token de acceso de Docker Hub.

## Estructura del Pipeline

### Build

El job de `build` realiza las siguientes acciones:

1. **Checkout del Repositorio Actual:**  
   Clona el repositorio actual donde se ejecuta el workflow.

2. **Checkout del Repositorio Externo:**  
   Clona el repositorio `proyecto-si8811a-2024-ii-u1-desarrollo-api-back` desde la rama `desarrollo`, donde se encuentra el `Dockerfile` y el archivo de proyecto `.csproj`.

3. **Configuración del SDK de .NET:**  
   Configura el entorno con la versión de .NET Core SDK especificada.

4. **Restauración de Dependencias:**  
   Restaura las dependencias de la aplicación .NET.

5. **Construcción de la Aplicación:**  
   Compila la aplicación utilizando la configuración de `Release`.

6. **Ejecución de Pruebas:**  
   Ejecuta las pruebas para asegurarse de que la aplicación funcione correctamente.

7. **Construcción y Subida de la Imagen Docker:**  
   Construye la imagen Docker utilizando el `Dockerfile` clonado y la sube a Docker Hub.

### Deploy

El job de `deploy` realiza las siguientes acciones:

1. **Despliegue del Contenedor Docker:**
   - Descarga (`pull`) la última imagen de Docker desde Docker Hub.
   - Detiene (`stop`) y elimina (`rm`) cualquier contenedor existente con el mismo nombre.
   - Inicia (`run`) un nuevo contenedor utilizando la última imagen.

## Configuración de Secretos

1. **GITHUB_TOKEN:** Se utiliza para autenticar las solicitudes entre repositorios.
2. **DOCKER_HUB_USERNAME:** Tu nombre de usuario de Docker Hub.
3. **DOCKER_HUB_ACCESS_TOKEN:** Un token de acceso generado desde Docker Hub (puedes crear uno desde tu perfil en Docker Hub, bajo "Security").

## Cómo Funciona

1. **Automatización:** Cada vez que se realiza un push a la rama `ApiFuncion`, el pipeline se ejecuta automáticamente.
2. **Construcción y Pruebas:** El pipeline construye la aplicación .NET, ejecuta pruebas y verifica que todo esté en orden antes de proceder con el despliegue.
3. **Despliegue Automático:** Después de una construcción y pruebas exitosas, la imagen Docker se despliega automáticamente en un contenedor.

## Cómo Ejecutar el Pipeline

Para ejecutar el pipeline:

1. **Haz un Commit y Push a la Rama `ApiFuncion`:** Realiza cualquier cambio necesario en tu código y haz un commit y push a la rama `ApiFuncion`.
2. **Verifica el Resultado:** Ve a la pestaña **Actions** en tu repositorio de GitHub para verificar el progreso del pipeline y cualquier error que ocurra.
3. **Verifica el Despliegue:** Asegúrate de que la aplicación se haya desplegado correctamente accediendo al contenedor Docker en el puerto configurado (por ejemplo, `8080`).
