dsc_resource 'Set_Time_Zone' do
	module_name :xTimeZone
	resource    :xTimeZone
	property    :TimeZone, 'Eastern Standard Time'
end

dsc_resource 'Disk_Drive' do
	module_name :xStorage
	resource    :xWaitforDisk
	property    :DiskNumber, 1
	property    :RetryIntervalSec, 60	
	property    :RetryCount, 60
end

dsc_resource 'Data_Volume' do
	module_name :xStorage
	resource 	:xDisk
	property    :DiskNumber, 1
	property    :DriveLetter, 'D'	
	property	:FSLabel, 'Data'
end

dsc_resource 'connect.carmax.local' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, "connect.carmax.local"
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

dsc_resource 'connect.carmax.local-appraisal' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, "connect.carmax.local-appraisal"
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

dsc_resource 'connect.carmax.local-hub-v1' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, "connect.carmax.local-hub-v1"
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

dsc_resource 'connect.carmax.local-hub-v2' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, "connect.carmax.local-hub-v2"
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

dsc_resource 'connect.carmax.local-start' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, 'connect.carmax.local-hub-start'
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

dsc_resource 'connect.carmax.local-wrm' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, 'connect.carmax.local-hub-wrm'
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

dsc_resource 'mep.carmax.local' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, 'mep.carmax.local'
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

dsc_resource 'merchandisingapi.carmax.local' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, "merchandisingapi.carmax.local"
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

dsc_resource 'rsa.carmax.local' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, "rsa.carmax.local"
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

dsc_resource 'salesapi.carmax.local' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, 'salesapi.carmax.local'
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

dsc_resource 'vehiclespecapi.carmax.local' do
	module_name :xWebAdministration
	resource 	:xWebAppPool
	property    :Name, 'vehiclespecapi.carmax.local'
	property    :Ensure, 'Present'	
	property	:State, 'Started'
end

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

dsc_resource 'Connect Appraisal Websites' do
	resource    :File
	property    :Ensure, 'Present'
	property    :Recurse, true
	property    :SourcePath, 'C:\\vagrant\\Data_Drive\\Websites\\connect.carmax.local'
	property    :DestinationPath, 'D:\\Data_Drive\\Websites\\connect.carmax.local'
end


#dsc_resource "connect.carmax.local" do
#	module_name :xWebAdministration
#	resource 	:xWebsite
#	property    :Ensure, 'Present'	
#	property	:State, 'Started'
#	property	:PhysicalPath, 'D:\Websites\connect.carmax.local'
#	property	:ApplicationPool, 'connect.carmax.local'
#	            BindingInfo     = @(
#                MSFT_xWebBindingInformation
#                {
#                    Protocol              = "HTTPS"
#                    Port                  = 18106
#                },
#                MSFT_xWebBindingInformation
#                {
#                    Protocol              = "HTTP"
#                    Port                  = 8106
#                }
#            )
#end

