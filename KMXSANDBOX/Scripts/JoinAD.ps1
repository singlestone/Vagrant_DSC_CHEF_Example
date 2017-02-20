$domain = "kmxsandbox"
$password = "vagrant" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\administrator" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential

$RegistryKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
$RegistryEntry = "NicDisable"
Set-ItemProperty -Path $RegistryKey -Name $RegistryEntry -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command "Disable-NetAdapter –Name Ethernet –Confirm:$false"'

Restart-Computer -force