dsc_resource "Set_Time_Zone" do
	module_name :xTimeZone
	resource    :xTimeZone
	property    :TimeZone, 'Eastern Standard Time'
end

#dsc_resource "Disk2" do
#	module_name :xStorage
#	resource    :xWaitforDisk
#	property    :DiskNumber, 1
#	property    :RetryIntervalSec, 60	
#	property    :Count, 60
#end

#dsc_resource "NVolume" do
#	module_name :xDisk
#	resource 	:xStorage
#	property    :DiskNumber, 1
#	property    :DriveLetter, 'N'	
#end

windows_package 'Install Splunk' do
  action :install
  source 'C:\vagrant\software\splunkforwarder-6.4.1-debde650d26e-x64-release.msi'
  options 'AGREETOLICENSE=Yes /q'
end

windows_package 'Install Rewrite 2.0' do
  action :install
  source 'C:\vagrant\software\rewrite_2.0_rtw_x64.msi'
  options '/quiet'
end

windows_package 'Install Asp Net MVC 3' do
  action :install
  source 'C:\vagrant\software\AspNetMVC3Setup.exe'
  installer_type :custom
  options '/quiet'
end

windows_package 'Install Asp Net MVC 4' do
  action :install
  source 'C:\vagrant\software\AspNetMVC4Setup.exe'
  installer_type :custom
  options '/quiet'
end

