<header>

## 🇪🇸 `README.es.md`

```markdown
# Estrategia de Eliminación de Duplicados en OneDrive

## 🧠 Resumen

Este proyecto documenta y automatiza una solución real para consolidar y deduplicar documentos en un entorno Windows multiusuario sincronizado con OneDrive.

Incluye scripts PowerShell y una estrategia completa para:

- Auditar y corregir la configuración de sincronización de OneDrive
- Clasificar documentos por tipo (PDF, DOCX, XML, etc.)
- Normalizar nombres de archivo largos (>260 caracteres)
- Eliminar duplicados exactos mediante hash SHA256
- Consolidar todos los archivos válidos en un usuario maestro (`AntonioMadroñal`)

> 🇬🇧 This project is also available in [English](README.md)

---

## 📁 Estructura

scripts/
├── organizar_documentos.ps1 # Classify files by type
├── AnalisisHashpresente.ps1 # Remove duplicates via hash
├── ConsolidarEnAntonio.ps1 # (Coming soon) Final consolidation
├── audPerfiles.ps1 # Profile scanning
docs/
├── Estrategia_Hash_Onedrive.md # Technical strategy article



---

## ⚙️ Requirements

- Windows 10/11 with PowerShell 5.1 or 7+
- Administrator privileges
- OneDrive client properly installed

---

## 🚀 Usage

1. **Classify files**
   ```powershell
   .\organizar_documentos.ps1

.\AnalisisHashpresente.ps1
.\ConsolidarEnAntonio.ps1


<footer>
📦 Features
Recursive directory scan

SHA256 content-based comparison

Keeps only the most recent file

Ready for OneDrive and SharePoint integration

🔐 License
MIT License

👤 Author
Antonio Madroñal Gómez | LinkedIn: https://www.linkedin.com/in/antoniocarpf
© 2025 Getafe, Madrid – Spain
<!--
  <<< Author notes: Footer >>>
  Add a link to get support, GitHub status page, code of conduct, license link.
-->

---

Antonio Madroñal Gómez | Linkedin (https://www.linkedin.com/in/antoniocarpf/) © 2025 Getafe , Madrid - España -
</footer>
