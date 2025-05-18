# 🗃️ Estrategia de Eliminación de Duplicados en OneDrive

## 🧠 Resumen

Este proyecto documenta y automatiza una solución real para **consolidar y deduplicar documentos** en un entorno Windows multiusuario sincronizado con OneDrive.

Incluye scripts PowerShell y una estrategia completa para:

- 🧪 Auditar y corregir la configuración de sincronización de OneDrive
- 🗂️ Clasificar documentos por tipo (PDF, DOCX, XML, etc.)
- ✍️ Normalizar nombres de archivo largos (>260 caracteres)
- 🔍 Eliminar duplicados exactos mediante hash SHA256
- 📦 Consolidar todos los archivos válidos en un usuario maestro (`AntonioMadroñal`)

> 🇬🇧 This project is also available in [English](README.md)

---

## 📁 Estructura del proyecto

scripts/
├── organizar_documentos.ps1 # Clasifica archivos por tipo
├── AnalisisHashpresente.ps1 # Elimina duplicados usando hash SHA256
├── ConsolidarEnAntonio.ps1 # (Próximamente) Consolidación final
├── audPerfiles.ps1 # Escaneo de perfiles de usuario
docs/
└── Estrategia_Hash_Onedrive.md # Artículo explicativo detallado

---

## ⚙️ Requisitos

- Windows 10/11 con PowerShell 5.1 o superior
- Permisos de administrador
- Cliente de OneDrive instalado y correctamente configurado

---

## 🚀 Ejecución básica

```powershell
# Paso 1: Clasificar archivos
.\organizar_documentos.ps1

# Paso 2: Detectar duplicados
.\AnalisisHashpresente.ps1

# Paso 3: Consolidar (próximamente)
.\ConsolidarEnAntonio.ps1

📦 Funcionalidades
Escaneo recursivo de directorios

Comparación basada en contenido (SHA256)

Conserva la versión más reciente de los archivos duplicados

Preparado para integración con OneDrive y SharePoint

👤 Autor
Antonio Madroñal Gómez
📍 Getafe, Madrid, España
🔗 LinkedIn
📧 antonio.madronal@carpf.es

🔐 Licencia
Este proyecto se publica bajo la Licencia Ética Profesional CARPF.
Uso educativo y personal libre con atribución.
El uso profesional se realiza bajo contrato.

🌐 Proyecto relacionado
Este repositorio forma parte de la iniciativa ética y profesional CARPF.
Descubre más sobre el marco completo en:

👉 Protocolo CARPF Ético HumanIA


---

¿Quieres que lo subamos directamente al repositorio como `README.es.md` actualizado? También puedo ayudarte a preparar la versión en inglés (`README.md`) para mantener la coherencia internacional.

