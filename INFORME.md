# Informe Técnico: Arquitectura y Análisis del Modelo OSI
**Estudiante:** Mariana Gil Rincon

## Sección 1: Topología y Flujo de Información

### 1.1 Diagrama de Arquitectura
*(Nota: Este diagrama está hecho en Mermaid, GitHub lo renderizará automáticamente como imagen).*

```mermaid
graph TD
    Usuario((Navegador Cliente)) -->|HTTP:80| Nginx[Nginx Reverse Proxy]
    
    subgraph frontend_net [Red: frontend_net]
        Nginx -->|Ruta /| Joomla[Joomla CMS]
        Nginx -->|Ruta /jupyter| Jupyter[Jupyter Notebook]
        Nginx -->|Ruta /grafana| Grafana[Grafana Dashboards]
    end

    subgraph backend_net [Red: backend_net]
        Joomla -->|TCP:5432| DB[(PostgreSQL)]
        Grafana -->|Queries SQL| DB
    end
    
    %% Flujo de Logs (Volúmenes)
    Joomla -.->|Escribe logs| Vol[Volumen: shared_logs]
    Vol -.->|Lee logs| Grafana