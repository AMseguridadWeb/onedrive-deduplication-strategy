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

Antonio Madroñal Gómez © 2025 Getafe , Madrid (Espàña)
