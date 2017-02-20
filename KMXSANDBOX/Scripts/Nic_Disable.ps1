$RegistryKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
$RegistryEntry = "NicDisable"
Set-ItemProperty -Path $RegistryKey -Name $RegistryEntry -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command "Disable-NetAdapter –Name Ethernet –Confirm:$false"'
Restart-Computer -force	