# Install_Splunk_F.ps1
# Install's SPlunk Forwarder on server
# Requires output.conf and %HOSTNAME%_input.conf to be present in the same directory as the install script

# This will return the directory the script is located in.
function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}

# Sets the the path of the scripts directory as the root path.
$root = Get-ScriptDirectory

# The Arguments for install the Splunk Forwarder's MSI
$Arguements = "/i C:\vagrant\software\splunkforwarder-6.4.1-debde650d26e-x64-release.msi AGREETOLICENSE=Yes /q"

# Location of the output.conf file.
$Output_Path = "$root\outputs.conf"

# Location of the input.conf file.
#$Input_Config = $env:computername + "_inputs.conf"
#$Input_Path = "$root\input_configs\$Input_Config"

# First run a quick test to make sure the paths exist, if not fail out of the script, otherwise proceed.
#if(!(Test-Path $Output_Path)){
#    Write-Host "Error!!! File $Output_Path Not Found, Quiting"
#    Exit
#}
#Elseif(!(Test-Path $Input_Path)){
#    Write-Host "Error!!! File $Output_Path Not Found, Quiting"
#    Exit
#}
#Else{
    # Install the Application
    Start-Process -FilePath msiexec.exe -ArgumentList $Arguements -wait

    # Copy the Configuration Files
#    Copy-Item -Path $Output_Path -Destination 'C:\Program Files\SplunkUniversalForwarder\etc\system\default\outputs.conf'
#    Copy-Item -Path $Input_Path -Destination 'C:\Program Files\SplunkUniversalForwarder\etc\system\default\inputs.conf'

    # Restart the service 
    Restart-Service SplunkForwarder
#}

#Assuming no errors, Splunk is not gathering log data from this server!
