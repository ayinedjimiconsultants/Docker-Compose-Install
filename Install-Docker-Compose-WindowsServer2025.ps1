# Réalisé par Ayi NEDJIMI Consultants

# Chemin de destination
$targetDir = "C:\Program Files\Docker"
$composePath = Join-Path $targetDir "docker-compose.exe"

# URL de la dernière version stable (v2.27.0 à ce jour)
$composeUrl = "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-windows-x86_64.exe"

# Création du dossier si besoin
if (-not (Test-Path $targetDir)) {
    Write-Output "Création du dossier $targetDir..."
    New-Item -Path $targetDir -ItemType Directory -Force | Out-Null
}

# Téléchargement
Write-Output "Téléchargement de docker-compose.exe..."
Invoke-WebRequest -Uri $composeUrl -OutFile $composePath -UseBasicParsing

# Vérification du fichier
if (Test-Path $composePath) {
    Write-Output "docker-compose.exe téléchargé avec succès."
} else {
    Write-Error "Le téléchargement a échoué. Abandon."
    exit 1
}

# Ajout au PATH (variable système)
Write-Output "Ajout de docker-compose au PATH système..."
$envPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
if (-not ($envPath -like "*$targetDir*")) {
    [Environment]::SetEnvironmentVariable("Path", "$envPath;$targetDir", [EnvironmentVariableTarget]::Machine)
    Write-Output "Chemin ajouté. Redémarrez votre session PowerShell pour l’appliquer."
} else {
    Write-Output "Le chemin est déjà présent."
}

# Test
Write-Output "`nTest de la version docker-compose :"
Start-Sleep -Seconds 2
& "$composePath" version
