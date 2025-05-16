# Estrategia de Consolidación y Eliminación de Duplicados en Entornos Windows Multiusuario con OneDrive

## 1. Introducción

En entornos Windows donde existen múltiples perfiles de usuario (“00”, “01”, etc.), es común encontrar documentos duplicados dispersos en diversas ubicaciones, como carpetas de escritorio, descargas, OneDrive o subdirectorios internos. Esta situación conlleva a:

- Duplicidad innecesaria de documentos.
- Fragmentación documental.
- Riesgos de versionado y sincronización.

Este documento resume una estrategia técnica ejecutada para:

- Consolidar todo el contenido último y relevante bajo un solo usuario maestro (`AntonioMadroñal`).
- Reorganizar documentos por tipo y extensión.
- Eliminar archivos duplicados mediante HASH.
- Asegurar que OneDrive sincronice únicamente los documentos definitivos.

---

## 2. Corrección de Sincronización OneDrive

### 2.1 Problema identificado

- Múltiples instancias de OneDrive activas en perfiles distintos.
- Carpetas como `OneDrive - carpf (1)` generaban conflictos.

### 2.2 Solución

- Se desvincularon OneDrive de perfiles innecesarios.
- Se reconfiguró OneDrive en `AntonioMadroñal` como el nodo principal de sincronización.

---

## 3. Auditoría y Clasificación Inicial de Archivos

### 3.1 Scripts empleados

- `organizar_documentos.ps1`: Clasifica todos los archivos por extensión (.pdf, .docx, .xml, etc.) en carpetas tipo `tmpPdf`, `tmpDocx`...
- `audPerfiles.ps1`: Recorre perfiles `00` a `05`, listando o depurando contenido

### 3.2 Clasificación automática

Se crearon subdirectorios automáticos dentro del perfil:

tmpPdf/
tmpDocx/
tmpXml/
tmpCsv/
tmpJpg/
tmpPng/


---

## 4. Normalización de nombres largos

### 4.1 Problema

- Rutas de más de 260 caracteres generaban errores de movimiento y sincronización.

### 4.2 Solución

- Se truncaron nombres de archivos a 100 caracteres + sufijo `_acortado.ext`

---

## 5. Auditoría por HASH y Eliminación de Duplicados

### 5.1 Script

- `AnalisisHashpresente.ps1`:
  - Calcula SHA256 de todos los archivos en perfiles de usuario.
  - Identifica duplicados por contenido, no por nombre.
  - Elimina el archivo más antiguo y conserva el más reciente.

### 5.2 Resultado

- Limpieza total de duplicados.
- En cada carpeta `tmp*` queda una sola versión por documento.

---

## 6. Consolidación Final hacia Usuario Maestro

### 6.1 Plan

- Desde perfiles `00` a `05`, se comparan los archivos con los presentes en `AntonioMadroñal` (por HASH).
- Se copian únicamente los no presentes.

### 6.2 Estado actual

- Lista de archivos ya optimizada por usuario.
- Preparación del script de consolidación final.

---

## 7. Conclusiones

- Reducción del espacio en disco
- Estructura documental unificada
- Integridad garantizada con SHA256
- Preparado para integración total con OneDrive y SharePoint

---

## 8. Recursos Compartidos

- `organizar_documentos.ps1`
- `AnalisisHashpresente.ps1`
- `audPerfiles.ps1`

Se recomienda publicar estos scripts en un repositorio Git para su mejora y distribución.

Antonio Madroñal Gomez (CARPF)
