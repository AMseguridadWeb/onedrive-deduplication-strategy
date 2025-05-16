$perfiles = Get-ChildItem "C:\Users" | Where-Object { Test-Path "$($_.FullName)\AppData" }

foreach ($perfil in $perfiles) {
    $userPath = $perfil.FullName
    Write-Host "`n=== Perfil detectado: $($perfil.Name) ===" -ForegroundColor Yellow
    Write-Host "Ruta completa: $userPath"

    # Buscar cualquier subdirectorio que empiece por OneDrive
    $oneDrives = Get-ChildItem -Path $userPath -Directory | Where-Object { $_.Name -like "OneDrive*" }
    if ($oneDrives.Count -gt 0) {
        foreach ($od in $oneDrives) {
            Write-Host "✔️ OneDrive: ACTIVADO en $($od.FullName)"
        }
    } else {
        Write-Host "❌ OneDrive: NO DETECTADO"
    }

    $documentos = Join-Path $userPath "Documents"
    $imagenes   = Join-Path $userPath "Pictures"
    if (Test-Path $documentos) { Write-Host "📄 Documentos:     $documentos" }
    if (Test-Path $imagenes)   { Write-Host "🖼️ Imágenes:       $imagenes" }

    $appDataPath = Join-Path $userPath "AppData"
    if (Test-Path $appDataPath) {
        $tam = (Get-ChildItem $appDataPath -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB
        Write-Host "📦 AppData:       $([math]::Round($tam, 2)) MB"
    }
}
