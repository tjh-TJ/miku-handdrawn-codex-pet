$ErrorActionPreference = "Stop"
$Source = Join-Path $PSScriptRoot "pet\miku-handdrawn"
$PetsRoot = if ($env:CODEX_PETS_DIR) { $env:CODEX_PETS_DIR } else { Join-Path $env:USERPROFILE ".codex\pets" }
$Destination = Join-Path $PetsRoot "miku-handdrawn"

if (-not (Test-Path (Join-Path $Source "pet.json"))) { throw "Missing pet.json" }
if (-not (Test-Path (Join-Path $Source "spritesheet.webp"))) { throw "Missing spritesheet.webp" }

New-Item -ItemType Directory -Force -Path $Destination | Out-Null
Copy-Item (Join-Path $Source "pet.json") (Join-Path $Destination "pet.json") -Force
Copy-Item (Join-Path $Source "spritesheet.webp") (Join-Path $Destination "spritesheet.webp") -Force

Write-Host "Hand-drawn Miku installed to $Destination"
Write-Host "Open Codex Settings > Pets and choose Refresh."
