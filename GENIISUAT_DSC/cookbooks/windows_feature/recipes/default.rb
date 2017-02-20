#
# Cookbook Name:: windows_feature
# Recipe:: default
#
# Copyright (C) 2015 EBSCO
#
# All rights reserved - Do Not Redistribute
#

# Install the mixlibary-core gem and it's dependencies.
# This is required for the manage_feature LWRP to work.

gem_version="0.0.15"

myexecuteaction = execute "#{cookbook_name}_gem_update" do
  command 'gem update --system'
  not_if do 
     
    def isgreater
      #The Gem executable version needs to be a certain
      myver=Gem::Version.new(Gem::VERSION)
      versionsegments=myver.segments 
      Chef::Log::debug("Version found: #{myver}")
        
      #Greater than or equal to 2.4
      raise "Invalid version detected" if versionsegments.length < 2
      return false if versionsegments[0] < 2
      return false if versionsegments[1] < 4  
        
      return true
    end
      
    ::Gem.clear_paths 
    retval = isgreater()
    Chef::Log::debug("Is greater:#{retval}")
    #return  --- Cannot use the return statement - breaks chef D apparently
    retval
  end
  action :nothing
end

myexecuteaction.run_action(:run)

mycustomgem = gem_package "#{cookbook_name}_install_mixlibrary-core" do
  package_name "mixlibrary-core"
  options "--minimal-deps" 
  version gem_version
  action :nothing
end

mycustomgem.run_action(:install)

#Make available in current process by clearing paths
#Require calls to mixlib need to be in method calls since they need to be "delayed" because of Chef loading order. https://sethvargo.com/using-gems-with-chef/
#Right now we are telling everyone to lazy load their require statements.  No matter what this is a hack.  Might be a Chef issue that needs to be opened up.
::Gem.clear_paths 