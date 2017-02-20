Install-WindowsFeature File-Services,FS-FileServer,FS-iSCSITarget-Server 

New-Item `
	-path N:\ `
	-name VHDs `
	-itemtype directory
New-IscsiVirtualDisk -Path N:\VHDs\LUN1.vhdx -Size 2GB
New-IscsiVirtualDisk -Path N:\VHDs\LUN2.vhdx -Size 10GB
New-IscsiServerTarget -TargetName Quorumtarget -InitiatorId IPAddress:192.168.3.20,IPAddress:192.168.3.30
Add-IscsiVirtualDiskTargetMapping -TargetName Quorumtarget -DevicePath "N:\VHDs\LUN1.vhdx"

New-IscsiServerTarget -TargetName MSMQtarget -InitiatorId IPAddress:192.168.3.20,IPAddress:192.168.3.30
Add-IscsiVirtualDiskTargetMapping -TargetName MSMQtarget -DevicePath "N:\VHDs\LUN2.vhdx"

