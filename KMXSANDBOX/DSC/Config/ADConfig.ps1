param (
    [string]$nodeName = "localhost",
    [string]$mofFolder = "C:\tmp\MOF\"
)

if (Test-Path($mofFolder)) {
    Remove-Item $mofFolder -Recurse -Force
}
New-Item -ItemType directory -Path $mofFolder | Out-Null
Set-Location $mofFolder | Out-Null

$secpasswd01 = ConvertTo-SecureString "yhs.is4U" -AsPlainText -Force
$safemodeAdminCred = New-Object System.Management.Automation.PSCredential ('(Password Only)', $secpasswd01)

$secpasswd02 = ConvertTo-SecureString "yhs.is4U" -AsPlainText -Force
$domainCred = New-Object System.Management.Automation.PSCredential ('(Password Only)', $secpasswd02)
            
# Configuration Data for AD              
$ConfigData = @{             
    AllNodes = @(             
        @{             
            Nodename = "kmxsbdc01"             
            Role = "Primary DC"             
            DomainName = "kmxsandbox.com"             
            RetryCount = 20              
            RetryIntervalSec = 30            
            PsDscAllowPlainTextPassword = $true            
        }            
    )             
}   

configuration NewDomain             
{             
   param             
    (             
        [Parameter(Mandatory)]             
        [pscredential]$safemodeAdministratorCred,             
        [Parameter(Mandatory)]            
        [pscredential]$domainCred            
    )             
            
    Import-DscResource -ModuleName xActiveDirectory             
            
    Node $AllNodes.Where{$_.Role -eq "Primary DC"}.Nodename             
    {             
            
        LocalConfigurationManager            
        {            
            ActionAfterReboot = 'ContinueConfiguration'            
            ConfigurationMode = 'ApplyOnly'            
            RebootNodeIfNeeded = $false

        }            
            
        File ADFiles            
        {            
            DestinationPath = 'N:\NTDS'            
            Type = 'Directory'            
            Ensure = 'Present'            
        }            
                    
        WindowsFeature ADDSInstall             
        {             
            Ensure = "Present"             
            Name = "AD-Domain-Services"             
        }            
            
        # Optional GUI tools            
        WindowsFeature ADDSTools            
        {             
            Ensure = "Present"             
            Name = "RSAT-ADDS"             
        }            
            
        # No slash at end of folder paths            
        xADDomain FirstDS             
        {             
            DomainName = $Node.DomainName             
            DomainAdministratorCredential = $domainCred             
            SafemodeAdministratorPassword = $safemodeAdministratorCred            
            DatabasePath = 'N:\NTDS'            
            LogPath = 'N:\NTDS'            
            DependsOn = "[WindowsFeature]ADDSInstall","[File]ADFiles"            
        }      
             
	}
	
}            
         
            
NewDomain -ConfigurationData $ConfigData `
	-safemodeAdministratorCred $safemodeAdminCred `
	-domainCred $domainCred         
  
# Make sure that LCM is set to continue configuration after reboot            
Set-DSCLocalConfigurationManager -Path .\NewDomain -Verbose            
            
# Build the domain 
Start-DscConfiguration -Wait -Force -Path .\NewDomain -Verbose   


Restart-Computer
