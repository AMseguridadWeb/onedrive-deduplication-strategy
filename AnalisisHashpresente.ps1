# Hashtable para registrar hashes
$hashTable = @{}

# Función para calcular hash SHA256
function Get-FileHashSHA256($filePath) {
    if (Test-Path $filePath) {
        return (Get-FileHash -Path $filePath -Algorithm SHA256).Hash
    }
    return $null
}

# Carpeta base: donde estés ejecutando
$carpetaBase = Get-Location
$archivos = Get-ChildItem -Path $carpetaBase -Recurse -File

foreach ($archivo in $archivos) {
    $hash = Get-FileHashSHA256 $archivo.FullName

    if ($hash) {
        if ($hashTable.ContainsKey($hash)) {
            $archivoExistente = $hashTable[$hash]

            # Comparar por fecha de modificación
            if ($archivo.LastWriteTime -gt $archivoExistente.LastWriteTime) {
                # El actual es más reciente
                Remove-Item -Path $archivoExistente.FullName -Force
                $hashTable[$hash] = $archivo
                Write-Host "Eliminado duplicado antiguo: $($archivoExistente.FullName)"
                Write-Host "Conservado: $($archivo.FullName)"
            } else {
                # El existente es más reciente
                Remove-Item -Path $archivo.FullName -Force
                Write-Host "Eliminado duplicado más reciente (por nombre): $($archivo.FullName)"
            }
        } else {
            $hashTable[$hash] = $archivo
        }
    }
}
