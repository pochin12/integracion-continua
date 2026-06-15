# Usa una imagen base oficial de Python
FROM python:3.11-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia requerimientos primero (para optimizar caché de Docker)
COPY requirements.txt .

# Instala las dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código del proyecto dentro del contenedor
COPY . .

# El comando que se ejecuta cuando el contenedor arranca
CMD ["pytest", "tests/", "-v"]