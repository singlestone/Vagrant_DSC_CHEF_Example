
#$mofFolder = "C:\tmp\MOF\"
$mofFolder = "C:\vagrant\DSC\MOF\"
 

Set-Location $mofFolder | Out-Null

           
           
# Build the domain 

	
#Set-DSCLocalConfigurationManager -Path C:\vagrant\DSC\MOF\IPAddress_Parameterized -Verbose  
#Set-DSCLocalConfigurationManager -Path C:\vagrant\DSC\MOF\DnsServerAddress -Verbose  	
#Set-DSCLocalConfigurationManager -Path C:\vagrant\DSC\MOF\DhcpClient_Enabled -Verbose  
#Set-DSCLocalConfigurationManager -Path C:\vagrant\DSC\MOF\NewDomain -Verbose 

Start-DscConfiguration -Wait -Force -Path C:\vagrant\DSC\MOF\NewDomain -Verbose 
Start-DscConfiguration -Wait -Force -Path C:\vagrant\DSC\MOF\IPAddress_Parameterized -Verbose   
Start-DscConfiguration -Wait -Force -Path C:\vagrant\DSC\MOF\DnsServerAddress -Verbose   
Start-DscConfiguration -Wait -Force -Path C:\vagrant\DSC\MOF\DhcpClient_Enabled -Verbose
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ResetServerAddresses
$RegistryKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
$RegistryEntry = "AddUser"
Set-ItemProperty -Path $RegistryKey -Name $RegistryEntry -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -file "C:\vagrant\Scripts\AddUsers.ps1"'

Restart-computer -force