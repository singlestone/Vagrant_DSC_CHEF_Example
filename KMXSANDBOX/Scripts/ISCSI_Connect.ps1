Set-Service msiscsi -startuptype "automatic"
Start-Service -name msiscsi

New-IscsiTargetPortal -TargetPortalAddress 192.168.3.10
$Available_Luns = Get-IscsiTarget

if(!($Available_Luns.IsConnected[0])){
    Connect-IscsiTarget -NodeAddress $Available_Luns.NodeAddress[0] -IsPersistent:$true
    Connect-IscsiTarget -NodeAddress $Available_Luns.NodeAddress[1] -IsPersistent:$true
}