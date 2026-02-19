$ErrorActionPreference = "Stop"
$RobloxVersionsDir = "$env:LOCALAPPDATA\Roblox\Versions"
$StudioPath = Get-ChildItem -Path $RobloxVersionsDir -Recurse -Filter "RobloxStudioBeta.exe" | Select-Object -ExpandProperty Directory -First 1
if (-not $StudioPath) {
    Write-Error "Roblox Studio installation not found."
    exit
}
$RobloxContent = Join-Path $StudioPath.FullName "content"
$LocalAssetsLink = Join-Path $RobloxContent "LocalAssets"
$UserAssetsDir = Join-Path $env:USERPROFILE "rbxlocalassets"
Write-Host "Roblox Studio Local Assets Linker for Windows."
Write-Host "Made by Riddance Club Team."
Write-Host ""
if (-not (Test-Path $UserAssetsDir)) {
    New-Item -ItemType Directory -Path $UserAssetsDir | Out-Null
}
if (Test-Path $LocalAssetsLink) {
    Remove-Item -Path $LocalAssetsLink -Recurse -Force
}
New-Item -ItemType SymbolicLink -Path $LocalAssetsLink -Target $UserAssetsDir | Out-Null
Write-Host "Done! You will need to rerun this script every time Roblox Studio updates."
Write-Host "Usage:"
Write-Host "  Put all your local assets in: $UserAssetsDir"
Write-Host "  Access them in Studio using:"
Write-Host "  rbxassetid://LocalAssets/your_asset_here.png"