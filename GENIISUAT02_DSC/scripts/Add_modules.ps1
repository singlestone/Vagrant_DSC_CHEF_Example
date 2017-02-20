# Addmodules
Add-Type -assembly "system.io.compression.filesystem"

#PSWindowsUpdate
$BackUpPath = "C:\vagrant\modules\PSWindowsUpdate.zip"
$destination = "C:\Program Files\WindowsPowerShell\Modules"
[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)