[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/vK6WBQ1t)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=15560953)

# Proyecto: Automatización de API de Lugares

## Descripción

Este proyecto se centra en la automatización del flujo de trabajo para el despliegue de la API de lugares utilizando **GitHub Actions**. El proceso incluye la construcción de imágenes Docker y el despliegue de contenedores.

## Tecnologías Utilizadas

- **GitHub Actions**: Para la integración continua y el despliegue continuo (CI/CD).
- **Docker**: Para la contenedorización de la aplicación.
- **Docker Hub**: Para almacenar las imágenes Docker.

## Flujo de Trabajo Automatizado

### Activación del Flujo de Trabajo

El flujo de trabajo se activa mediante un `push` en la rama `ApisFunciones`.

### Pasos del Flujo de Trabajo

1. **Checkout del Repositorio**:
   - Clona el código del repositorio actual.
   
2. **Clonación del Repositorio Externo**:
   - Clona un repositorio externo que contiene el código de la API de lugares.
   - Comando:
     ```bash
     git clone --single-branch --branch Desarrollo https://github.com/UPT-FAING-EPIS/proyecto-si8811a-2024-ii-u1-api-y-funciones-zevallos-y-anahua.git external-repo
     ```

3. **Login en Docker Hub**:
   - Se utiliza la acción de inicio de sesión para Docker Hub utilizando las credenciales almacenadas en secretos de GitHub.
   - Configuración:
     ```yaml
     - name: Log in to Docker Hub
       uses: docker/login-action@v2
       with:
         username: ${{ secrets.DOCKER_HUB_USERNAME }}
         password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
     ```

4. **Construcción y Push de la Imagen Docker**:
   - Se construye la imagen Docker de la API y se sube a Docker Hub.
   - Configuración:
     ```yaml
     - name: Build and push Docker image
       uses: docker/build-push-action@v4
       with:
         context: ./external-repo/api_lugares
         file: Dockerfile
         push: true
         tags: palbertt/automatizacion:api2-v1.0.0
     ```

5. **Despliegue del Contenedor Docker**:
   - Se ejecuta el contenedor de la API en segundo plano.
   - Comando:
     ```bash
     docker run -d -p 5000:5000 palbertt/automatizacion:api2-v1.0.0
     ```

### Archivo YAML - GitHub Actions

```yaml
name: Deploy External API-zevallos-y-anahua

on:
  push:
    branches:
      - ApisFunciones

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Clone external repository (Desarrollo branch)
        run: git clone --single-branch --branch Desarrollo https://github.com/UPT-FAING-EPIS/proyecto-si8811a-2024-ii-u1-api-y-funciones-zevallos-y-anahua.git external-repo

      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}

      - name: Build and push Docker image
        uses: docker/build-push-action@v4
        with:
          context: ./external-repo/api_lugares
          file: Dockerfile
          push: true
          tags: palbertt/automatizacion:api2-v1.0.0

      - name: Deploy Docker Container
        run: |
          docker run -d -p 5000:5000 palbertt/automatizacion:api2-v1.0.0

