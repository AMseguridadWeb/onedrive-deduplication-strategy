# OneDrive Deduplication Strategy

## 🧠 Overview

This project documents and automates a real-world solution for consolidating and deduplicating user documents in a Windows multi-user environment synchronized with OneDrive.

It includes PowerShell scripts and a complete strategy to:

- Audit and fix OneDrive sync configuration
- Organize documents by type (PDF, DOCX, XML, etc.)
- Normalize filenames longer than 260 characters
- Remove exact duplicates using SHA256 hashing
- Consolidate all valid files into a master user (`AntonioMadroñal`)

> 🇪🇸 Este proyecto también está disponible en [español](README.es.md)

---

## 📁 Structure

scripts/
├── organizar_documentos.ps1 # Classify files by type
├── AnalisisHashpresente.ps1 # Remove duplicates via hash
├── ConsolidarEnAntonio.ps1 # (Coming soon) Final consolidation
├── audPerfiles.ps1 # Profile scanning
docs/
├── Estrategia_Hash_Onedrive.md # Technical strategy article

**


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
2. .\AnalisisHashpresente.ps1
3. .\ConsolidarEnAntonio.ps1

📦 Features
Recursive directory scan

SHA256 content-based comparison

Keeps only the most recent file

Ready for OneDrive and SharePoint integration

👤 Author
Antonio Madroñal Gómez | LinkedIn: https://www.linkedin.com/in/antoniocarpf
© 2025 Getafe, Madrid – Spain

Antonio Madroñal Gómez © 2025 Getafe , Madrid (Espàña)
