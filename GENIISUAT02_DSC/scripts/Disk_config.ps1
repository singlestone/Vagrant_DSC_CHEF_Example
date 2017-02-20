
		Initialize-Disk -Number 1
		New-Partition -DiskNumber 1 -AssignDriveLetter -UseMaximumSize
		Set-Partition -DriveLetter D -NewDriveLetter N
		Format-Volume -DriveLetter N -FileSystem NTFS -Confirm:$false