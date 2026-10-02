$ErrorActionPreference = "Stop"

Write-Host "Instalando Professional Discord Bot Skills..." -ForegroundColor Cyan

$repo = "https://github.com/ihyos/Professional-Discord-Bot-Skills.git"
$tempDir = Join-Path $env:TEMP ("discord_skill_" + [System.Guid]::NewGuid().ToString("N"))

git clone --depth 1 --filter=blob:none --sparse $repo $tempDir --quiet
Push-Location $tempDir
git sparse-checkout set skill.md "emojis discord" --quiet
Pop-Location

Copy-Item -Path (Join-Path $tempDir "skill.md") -Destination "." -Force
Copy-Item -Path (Join-Path $tempDir "emojis discord") -Destination "." -Recurse -Force

Remove-Item -Path $tempDir -Recurse -Force

Write-Host "Sucesso: skill.md e pasta 'emojis discord' instalados no projeto." -ForegroundColor Green
