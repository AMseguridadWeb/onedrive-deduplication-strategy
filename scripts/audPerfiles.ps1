# === Inicio de auditoría ===
Write-Host "Iniciando auditoría de perfiles de usuario..." -ForegroundColor Cyan

$perfiles = Get-ChildItem "C:\Users" | Where-Object { Test-Path "$($_.FullName)\AppData" }

foreach ($perfil in $perfiles) {
    $userPath = $perfil.FullName
    Write-Host "`n=== Perfil detectado: $($perfil.Name) ===" -ForegroundColor Yellow
    Write-Host "Ruta completa: $userPath"

    # OneDrive
    $oneDrivePath = Join-Path $userPath "OneDrive"
    if (Test-Path $oneDrivePath) {
        Write-Host "✔️ OneDrive: ACTIVADO en $oneDrivePath"
    } else {
        Write-Host "❌ OneDrive: NO DETECTADO"
    }

    # Carpetas personales
    $documentos = Join-Path $userPath "Documents"
    $imagenes   = Join-Path $userPath "Pictures"
    if (Test-Path $documentos) { Write-Host "📄 Documentos:     $documentos" }
    if (Test-Path $imagenes)   { Write-Host "🖼️ Imágenes:       $imagenes" }

    # AppData
    $appDataPath = Join-Path $userPath "AppData"
    if (Test-Path $appDataPath) {
        $tam = (Get-ChildItem $appDataPath -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB
        Write-Host "📦 AppData:       $([math]::Round($tam, 2)) MB"
    }
}
