# Parcial 2: Despliegue Multi-contenedor y Orquestación

**Materia:** Comunicaciones - Ingeniería Mecatrónica  
**Estudiante:Mariana Gil Rincon
  

## Descripción del Proyecto
Este repositorio contiene la infraestructura web orquestada mediante Docker Compose. El clúster integra 5 servicios segmentados de forma segura en redes `frontend` y `backend`:
1. **Nginx:** Edge Router y Reverse Proxy (Puerto 80).
2. **Joomla:** Sistema de Gestión de Contenidos (Capa 7).
3. **PostgreSQL:** Base de datos relacional con persistencia aislada.
4. **Jupyter Notebook:** Entorno de ciencia de datos y análisis.
5. **Grafana:** Plataforma de monitoreo de logs y métricas.

## Requisitos Previos
* Docker y Docker Compose
* Git

## Instrucciones de Despliegue (Zero-Touch Deployment)
De acuerdo con los parámetros de la evaluación, el clúster inicia limpiamente y sin pasos manuales ejecutando la siguiente secuencia de comandos:

```bash
# 1. Clonar el repositorio
git clone https://github.com/LadyMary07/parcial-2-comunicaciones

# 2. Ingresar a la carpeta del proyecto
cd parcial2com

# 3. Generar el archivo de variables de entorno por defecto
cp .env.example .env

# 4. Iniciar la infraestructura en segundo plano
docker compose up -d