# Addmodules
Add-Type -assembly "system.io.compression.filesystem"

#ActiveDirectory
$BackUpPath = "C:\vagrant\modules\xActiveDirectory-dev.zip"
$destination = "C:\Program Files\WindowsPowerShell\Modules"
[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)
Rename-Item $destination\xActiveDirectory-dev xActiveDirectory

#Networking
$BackUpPath = "C:\vagrant\modules\xNetworking-dev.zip"
$destination = "C:\Program Files\WindowsPowerShell\Modules"
[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)
Rename-Item $destination\xNetworking-dev xNetworking