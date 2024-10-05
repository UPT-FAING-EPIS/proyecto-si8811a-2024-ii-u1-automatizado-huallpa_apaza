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
# CI/CD Pipeline

Este repositorio utiliza un pipeline de CI/CD configurado con GitHub Actions para automatizar la construcción y despliegue de la aplicación. A continuación, se describe la configuración y los pasos involucrados en el pipeline.

## Descripción General

El pipeline se activa en cada `push` a la rama `ApisFunciones` y realiza las siguientes acciones:

1. Clona el repositorio actual.
2. Configura el entorno de Python.
3. Instala las dependencias del proyecto.
4. Configura Docker Buildx.
5. Almacena en caché las capas de Docker para optimizar el tiempo de construcción.
6. Inicia sesión en Docker Hub.
7. Construye y sube la imagen Docker.
8. Despliega el contenedor Docker.

## Configuración del Pipeline

El pipeline está configurado en el archivo `.github/workflows/ci-cd-pipeline.yml`. A continuación se detalla la estructura del archivo:

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - ApisFunciones  # Cambia esto según la rama correcta que uses

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout current repository
        uses: actions/checkout@v3
        with:
          repository: UPT-FAING-EPIS/proyecto-si8811a-2024-ii-u1-apis-y-funciones-meza-y-churacutipa
          ref: desarrollo

      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: 3.12  # La versión que usa el Dockerfile

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Cache Docker layers
        uses: actions/cache@v3
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-docker-${{ github.sha }}
          restore-keys: |
            ${{ runner.os }}-docker-

      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}

      - name: Build and push Docker image
        uses: docker/build-push-action@v4
        with:
          context: .  # Directorio del repositorio actual
          file: Dockerfile  # Usa el Dockerfile del proyecto
          push: true
          tags: palbertt/automatizacion:api1-v1.0.0

      - name: Deploy Docker Container
        run: |
          docker run -d -p 5000:5000 palbertt/automatizacion:api1-v1.0.0

