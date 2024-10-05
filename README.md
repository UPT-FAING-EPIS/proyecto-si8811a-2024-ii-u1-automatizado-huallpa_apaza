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
     ```

[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/vK6WBQ1t)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=15560953)

# CI/CD Pipeline para Automatización de API de Lugares

## Descripción

Este proyecto implementa un pipeline de CI/CD que automatiza la construcción y despliegue de una API de lugares utilizando **GitHub Actions** y **Docker**. El pipeline realiza tareas como la construcción de imágenes Docker, la instalación de dependencias de Python, y el despliegue automático del contenedor.

## Tecnologías Utilizadas

- **GitHub Actions**: Automatización de CI/CD.
- **Docker**: Contenerización de la aplicación.
- **Docker Hub**: Almacenamiento de imágenes Docker.
- **Python**: Lenguaje de programación y manejo de dependencias.

## Flujo de Trabajo Automatizado

### Activación del Flujo de Trabajo

El pipeline se activa automáticamente cuando se realiza un `push` en la rama `ApisFunciones`.

### Paso a Paso del Flujo de Trabajo

1. **Clonación del Repositorio Actual**:
   - El repositorio principal se clona desde la rama `desarrollo` para obtener el código actualizado.

2. **Configuración del Entorno Python**:
   - Se configura Python en el runner de GitHub para asegurar que todas las dependencias requeridas estén instaladas correctamente.

3. **Instalación de Dependencias**:
   - `pip` instala todas las dependencias del proyecto listadas en `requirements.txt`.

4. **Configuración de Docker Buildx**:
   - Se configura Docker Buildx para habilitar construcciones multiplataforma y cacheo avanzado de capas.

5. **Caché de Capas de Docker**:
   - Se almacena la caché de las capas de Docker para acelerar construcciones futuras.

6. **Login en Docker Hub**:
   - Se realiza la autenticación en Docker Hub usando las credenciales de usuario almacenadas como secretos en GitHub.

7. **Construcción y Push de la Imagen Docker**:
   - La imagen Docker se construye y se sube automáticamente a Docker Hub con la etiqueta especificada.

8. **Despliegue del Contenedor Docker**:
   - El contenedor Docker se despliega en segundo plano y la API se expone en el puerto 5000.

### Archivo YAML - GitHub Actions

Este es el archivo YAML completo que configura el flujo de trabajo para CI/CD:

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - ApisFunciones  # Cambia esto según la rama correcta que uses

jobs:
  build:
    runs-on: ubuntu-latest  # El trabajo se ejecuta en un runner de Ubuntu

    steps:
    - name: Checkout current repository  # Clona el repositorio actual
      uses: actions/checkout@v3
      with:
        repository: UPT-FAING-EPIS/proyecto-si8811a-2024-ii-u1-apis-y-funciones-meza-y-churacutipa  # Especifica el repositorio
        ref: desarrollo  # Rama de la cual se hace checkout

    - name: Set up Python  # Configuración del entorno Python
      uses: actions/setup-python@v4
      with:
        python-version: 3.12  # Versión de Python utilizada en el Dockerfile

    - name: Install dependencies  # Instalación de dependencias del proyecto
      run: |
        python -m pip install --upgrade pip  # Actualiza pip
        pip install -r requirements.txt  # Instala las dependencias desde requirements.txt

    - name: Set up Docker Buildx  # Configuración de Docker Buildx
      uses: docker/setup-buildx-action@v2

    - name: Cache Docker layers  # Habilita caché para las capas de Docker
      uses: actions/cache@v3
      with:
        path: /tmp/.buildx-cache  # Ruta para almacenar la caché
        key: ${{ runner.os }}-docker-${{ github.sha }}  # Clave única para identificar la caché
        restore-keys: |
          ${{ runner.os }}-docker-  # Claves para restaurar la caché si está disponible

    - name: Log in to Docker Hub  # Autenticación en Docker Hub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKER_HUB_USERNAME }}  # Usuario de Docker Hub almacenado en secretos
        password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}  # Token de acceso de Docker Hub almacenado en secretos

    - name: Build and push Docker image  # Construcción y push de la imagen Docker
      uses: docker/build-push-action@v4
      with:
        context: .  # Contexto de la construcción (repositorio actual)
        file: Dockerfile  # Especifica el Dockerfile para construir la imagen
        push: true  # La imagen se sube a Docker Hub
        tags: palbertt/automatizacion:api1-v1.0.0  # Etiqueta de la imagen

    - name: Deploy Docker Container  # Despliegue del contenedor Docker
      run: |
        docker run -d -p 5000:5000 palbertt/automatizacion:api1-v1.0.0  # Despliega el contenedor y lo expone en el puerto 5000
