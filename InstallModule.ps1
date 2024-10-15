param ($fullPath)

$fullPath = Join-Path 'C:\Users\finke\OneDrive\Documentos\PowerShell\Modules' 'PShell-AI'
Push-location $PSScriptRoot

Robocopy . $fullPath /mir /XD .vscode images .git .github CI __tests__ data mdHelp spikes /XF README.md README.original.md .gitattributes .gitignore filelist.txt install.ps1 InstallModule.ps1 PublishToGallery.ps1

Pop-Location