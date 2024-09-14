# Usa una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el contenido del directorio api_lugares del repositorio externo al contenedor
COPY api_lugares/ /app/api_lugares

# Establece el directorio de trabajo en el contenedor
WORKDIR /app/api_lugares

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto que la API usará
EXPOSE 8001

# Comando para ejecutar la aplicación
CMD ["python", "main.py"]
