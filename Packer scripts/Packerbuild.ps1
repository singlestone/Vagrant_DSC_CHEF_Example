#Script design

Function Packer_build {
    Param(
		$Path
	) #end Param

    try {
        Get-Location 

        $template_Location = Split-Path -Path $Path
        $template = Split-Path -Path $Path -Leaf

        Set-Location $template_Location
        packer build -force $template
        Set-Location $PSScriptRoot
        return $true
   }
   Catch {
        return $false
   }
}


Packer_build "C:\Users\9500547\Desktop\IaC\Packer\packer-windows-2012-r2\windows_2012_r2_virtualbox.json"

#This is a proof of automatically updating the version of a box

Function BoxVersion {
    Param(
		$Path,
        $BoxName,
        $Place = 4 #By default it just updates the fourth (last) decimal.
	) #end Param

    [int]$Place -= 1
    $LastBox = (Get-ChildItem $Path\$BoxName*.txt | Sort-Object Name -Descending | Select-Object -First 1).Name
    $Version = $LastBox.Trim(".txt").Trim("$BoxName").Trim("-")
    $Splitnum = $Version.Split(".")
    [int]$Splitnum[$Place] += 1
    $NewVersion = $Splitnum -join '.'
    $NewName = $BoxName + "-" + $NewVersion + ".txt"
    return $NewName
}

BoxVersion "C:\Users\9500547\Desktop\testlist" "image"