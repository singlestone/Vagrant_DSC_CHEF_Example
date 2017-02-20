require 'spec_helper'

describe file('c:\\Windows') do
  it { should be_directory }
  it { should_not be_writable.by('Everyone') }
end

=begin

describe group('Guests') do
  it { should exist }
end

describe service('DiagTrack') do
   it { should be_installed }
   it { should be_enabled }
   it { should be_running }
   it { should have_start_mode('Automatic') }
end

describe service('MpsSvc') do
   it { should be_installed }
   it { should be_enabled }
   it { should be_running }
   it { should have_start_mode('Automatic') }
end

describe service('Schedule') do
   it { should be_installed }
   it { should be_enabled }
   it { should be_running }
   it { should have_start_mode('Automatic') }
end

describe service('Spooler') do
   it { should be_installed }
   it { should be_enabled }
   it { should be_running }
   it { should have_start_mode('Automatic') }
end

describe service('lmhosts') do
   it { should be_installed }
   it { should be_enabled }
   it { should be_running }
   it { should have_start_mode('Automatic') }
end

=end