# Obtener la ruta actual desde donde se lanza el script
$directorioBase = Get-Location

# Definición de extensiones y carpetas destino
$estructura = @{
    "pdf"  = "tmpPdf"
    "docx" = "tmpDocx"
    "doc"  = "tmpDocx"
    "xml"  = "tmpXml"
    "csv"  = "tmpCsv"
    "jpg"  = "tmpJpg"
    "jpeg" = "tmpJpg"
    "png"  = "tmpPng"
}

# Crear subcarpetas si no existen
foreach ($carpeta in $estructura.Values | Sort-Object -Unique) {
    $rutaCompleta = Join-Path $directorioBase $carpeta
    if (-not (Test-Path $rutaCompleta)) {
        New-Item -Path $rutaCompleta -ItemType Directory | Out-Null
        Write-Host "Subdirectorio creado: $carpeta"
    }
}

# Obtener TODOS los archivos del directorio actual y subdirectorios
$archivos = Get-ChildItem -Path $directorioBase -File -Recurse

foreach ($archivo in $archivos) {
    # Omitir archivos que están sólo en la nube
    if ($archivo.Attributes -match "Offline") {
        Write-Host "$($archivo.Name): archivo solo en la nube, omitido." -ForegroundColor Yellow
        continue
    }

    # Obtener la extensión sin el punto
    $ext = $archivo.Extension.ToLower().TrimStart(".")

    if ($estructura.ContainsKey($ext)) {
        $destino = Join-Path $directorioBase $estructura[$ext]
        $nuevoNombre = Join-Path $destino $archivo.Name

        # Evitar mover si el archivo ya está ahí
        if ($archivo.FullName -ne $nuevoNombre) {
            try {
                Move-Item -Path $archivo.FullName -Destination $destino -Force
                Write-Host "$($archivo.Name) movido a $($estructura[$ext])"
            } catch {
                Write-Host "❌ Error al mover $($archivo.Name): $_" -ForegroundColor Red
            }
        }
    } else {
        Write-Host "$($archivo.Name): extensión no reconocida. No se movió."
    }
}

