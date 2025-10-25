# Imagen base
FROM python:3.10-slim

# Crear grupo y usuario
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

# Establece el directorio de trabajo
WORKDIR /app
# Copia el script al contenedor
COPY app.py .

# Instala Flask
RUN pip install flask
#RUN groupadd -r appgroup && useradd -r -g appgroup appus
RUN chown -R appuser:appgroup /app
USER appuser
# Expone el puerto en el que correrá la app
EXPOSE 3000
# Comando por defecto para ejecutar la app
CMD ["python", "app.py"]