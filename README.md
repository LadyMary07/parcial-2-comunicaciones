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
El repositorio incluye el archivo .env con las variables por defecto, por lo que basta con:

\ash
git clone https://github.com/LadyMary07/parcial-2-comunicaciones
cd parcial-2-comunicaciones
docker compose up -d
Joomla se instala solo (tarda cerca de 30-60 s la primera vez).

## Accesos

| Servicio | URL | Credenciales |
|----------|-----|--------------|
| Joomla | http://localhost | - |
| Joomla (admin) | http://localhost/administrator | admin / Admin12345!@# |
| Grafana | http://localhost/grafana/ | admin / admin |
| Jupyter | http://localhost/jupyter/?token=parcial123 | token: parcial123 |
