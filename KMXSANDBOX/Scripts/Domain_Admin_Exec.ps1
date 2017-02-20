$spath = "C:\vagrant\scripts\Cluster_Config.ps1"
$sa = "kmxsandbox\administrator"
$sap = "vagrant"
$sasp = ConvertTo-SecureString -String $sap -AsPlainText -Force
$sac = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $sa, $sasp 
Start-Process powershell.exe -Credential $sac -ArgumentList "C:\vagrant\scripts\Cluster_Config.ps1"
 