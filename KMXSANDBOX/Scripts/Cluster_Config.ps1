$Cluster_Name = "genmsq01s01"
$Node1 = "genutl01s01"
$Node2 = "genutl01s02"
$Network1 = "192.168.2.15"
$Network2 = "192.168.3.15"

New-Cluster -Name $Cluster_Name -Node $Node1,$Node2 -StaticAddress $Network1,$Network2
Get-ClusterAvailableDisk | Add-ClusterDisk
Initialize-Disk -Number 1
New-Partition -DiskNumber 1 -AssignDriveLetter -UseMaximumSize
Format-Volume -DriveLetter D -FileSystem NTFS -Confirm:$false
Initialize-Disk -Number 2
New-Partition -DiskNumber 2 -AssignDriveLetter -UseMaximumSize
Format-Volume -DriveLetter E -FileSystem NTFS -Confirm:$false
Get-ClusterAvailableDisk | Add-ClusterDisk
#Start-Sleep -s 20