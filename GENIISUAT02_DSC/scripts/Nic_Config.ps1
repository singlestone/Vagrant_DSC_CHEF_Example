$Arguments_1 =    'interface ip set address "Local Area Connection 2" static 192.168.2.45 255.255.255.0 192.168.2.10'
$Arguments_2 =    'interface ip add dns "Local Area Connection 2" 192.168.2.10'

Start-Process -FilePath netsh -ArgumentList $Arguments_1 -Wait
Start-Process -FilePath netsh -ArgumentList $Arguments_2 -Wait



#netsh interface ip set address "Local Area Connection 2" static 192.168.2.45 255.255.255.0 192.168.2.10
#netsh interface ip add dns "Local Area Connection 2" 192.168.2.10



<#
$MaskBits = 24 # This means subnet mask = 255.255.255.0
$Gateway = "192.168.2.10"
$Dns = "192.168.2.10"
$IPType = "IPv4"



# Retrieve the network adapter that you want to configure
$adapter = Get-NetAdapter | ? {$_.InterfaceAlias -eq "Ethernet 2"}
$address = Get-NetIPAddress | ? {$_.InterfaceIndex -eq $adapter.ifIndex -And $_.AddressFamily -eq "IPv4"}
$address.IPAddress

# Remove any existing IP, gateway from our ipv4 adapter
If (($adapter | Get-NetIPConfiguration).IPv4Address.IPAddress) {
    $adapter | Remove-NetIPAddress -AddressFamily $IPType -Confirm:$false
}

If (($adapter | Get-NetIPConfiguration).Ipv4DefaultGateway) {
    $adapter | Remove-NetRoute -AddressFamily $IPType -Confirm:$false
}

 # Configure the IP address and default gateway
New-NetIPAddress `
    -InterfaceIndex $adapter.ifIndex `
    -IPAddress $address.IPAddress `
    -AddressFamily $IPType `
    -PrefixLength $MaskBits `
    -DefaultGateway $Gateway

# Configure the DNS client server IP addresses
$adapter | Set-DnsClientServerAddress -ServerAddresses $DNS
#>