# Documentación del Flujo de Trabajo de GitHub Actions

Este repositorio incluye un flujo de trabajo de GitHub Actions que automatiza la construcción y publicación de imágenes Docker para la aplicación Python contenida en este repositorio. A continuación se detalla el proceso.

## Descripción del Flujo de Trabajo

El flujo de trabajo se ejecuta cada vez que se realiza un `push` a la rama `automatizacion`. Este realiza las siguientes acciones:

1. **Checkout del Repositorio**: Clona el repositorio que contiene el archivo `requirements.txt` y el código de la aplicación.
2. **Inicio de Sesión en Docker Hub**: Utiliza credenciales secretas para iniciar sesión en Docker Hub, lo que permite publicar imágenes en tu cuenta.
3. **Creación del Dockerfile**: Genera un `Dockerfile` temporal que especifica cómo construir la imagen Docker.
4. **Construcción de la Imagen Docker**: Construye la imagen Docker usando el `Dockerfile` creado.
5. **Publicación de la Imagen Docker**: Publica la imagen construida en Docker Hub.

## Flujo del trabajo

graph TD;
    A[Inicio: Push a la rama automatizacion] --> B[Checkout del repositorio];
    B --> C[Login en Docker Hub];
    C --> D[Crear un Dockerfile temporal];
    D --> E[Construir la imagen Docker];
    E --> F[Publicar la imagen en Docker Hub];
    F --> G[Fin del flujo de trabajo];


## Contenido del Flujo de Trabajo

El flujo de trabajo está definido en el archivo `.github/workflows/build-and-push.yml` y se ve así:

```yaml
name: Build and Push Docker Images

on:
  push:
    branches:
      - automatizacion

jobs:
  build-images:
    runs-on: ubuntu-latest

    steps:
      # Checkout el repositorio que contiene requirements.txt
      - name: Checkout the pruebas repository
        uses: actions/checkout@v3
        with:
          repository: UPT-FAING-EPIS/proyecto-si8811a-2024-ii-u1-pruebas-cano-valverde
          ref: main

      # Login en Docker Hub
      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}

      # Crear un Dockerfile temporal
      - name: Create Dockerfile
        run: |
          echo 'FROM python:3.9-slim' > Dockerfile
          echo 'WORKDIR /app' >> Dockerfile
          echo 'COPY requirements.txt .' >> Dockerfile
          echo 'RUN pip install --no-cache-dir -r requirements.txt' >> Dockerfile
          echo 'COPY . .' >> Dockerfile
          echo 'CMD ["python", "app.py"]' >> Dockerfile

      # Build y push de la imagen
      - name: Build Docker image for application
        run: |
          docker build -t palbertt/proyecto-si8811a-2024-ii-u1-pruebas-cano-valverde:Selenium .

      - name: Push Docker image for application
        run: |
          docker push palbertt/proyecto-si8811a-2024-ii-u1-pruebas-cano-valverde:Selenium
