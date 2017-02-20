param (
    [string]$nodeName = "localhost",
    [string]$mofFolder = "C:\tmp\MOF\"
)

Set-Location $mofFolder | Out-Null


configuration IPAddress_Parameterized 
{ 
    param 
    ( 
        [string[]]$NodeName = 'localhost', 
        [Parameter(Mandatory)] 
        [string]$IPAddress, 
        [Parameter(Mandatory)] 
        [string]$InterfaceAlias, 
        [int]$SubnetMask = 16, 
        [ValidateSet("IPv4","IPv6")] 
        [string]$AddressFamily = 'IPv4' 
    ) 
    Import-DscResource -Module xNetworking
    Node $NodeName 
    { 
        xIPAddress NewIPAddress 
        { 
            IPAddress      = $IPAddress 
            InterfaceAlias = $InterfaceAlias 
            SubnetMask     = $SubnetMask 
            AddressFamily  = $AddressFamily 
        } 
    } 
}

#Example: Set DNS Server Address
configuration DnsServerAddress 
{ 
    param 
    ( 
        [string[]]$NodeName = 'localhost', 
        [Parameter(Mandatory)] 
        [string]$DnsServerAddress, 
        [Parameter(Mandatory)] 
        [string]$InterfaceAlias, 
        [ValidateSet("IPv4","IPv6")] 
        [string]$AddressFamily = 'IPv4' 
    ) 
    Import-DscResource -Module xNetworking
        Node $NodeName 
    { 
        xDnsServerAddress DnsServerAddress 
        { 
            Address        = $DnsServerAddress 
            InterfaceAlias = $InterfaceAlias 
            AddressFamily  = $AddressFamily 
        } 
    } 
}

#Set the DHCP Client state

configuration DhcpClient_Enabled 
{
    param
    (
        [string[]]$NodeName = 'localhost',
        [Parameter(Mandatory)]
        [string]$InterfaceAlias,
        [Parameter(Mandatory)]
        [ValidateSet("IPv4","IPv6")]
        [string]$AddressFamily
    )

    Import-DscResource -Module xNetworking

    Node $NodeName
    {
        xDHCPClient EnableDhcpClient
        {
            State          = 'Enabled'
            InterfaceAlias = $InterfaceAlias
            AddressFamily  = $AddressFamily
        }
    }
}

IPAddress_Parameterized `
	-IPAddress "192.168.2.10" `
	-InterfaceAlias "Ethernet 2" `
	-SubnetMask 24
	
DnsServerAddress `
	-DnsServerAddress "192.168.2.10" `
	-InterfaceAlias "Ethernet 2"

	
DhcpClient_Enabled `
	-InterfaceAlias "Ethernet" `
	-AddressFamily "IPv4"
	
	Set-DSCLocalConfigurationManager -Path .\IPAddress_Parameterized -Verbose  
	Set-DSCLocalConfigurationManager -Path .\DnsServerAddress -Verbose  	
	Set-DSCLocalConfigurationManager -Path .\DhcpClient_Enabled -Verbose  

	
	Start-DscConfiguration -Wait -Force -Path .\IPAddress_Parameterized -Verbose   
	Start-DscConfiguration -Wait -Force -Path .\DnsServerAddress -Verbose   
	Start-DscConfiguration -Wait -Force -Path .\DhcpClient_Enabled -Verbose
	#restart-computer -force