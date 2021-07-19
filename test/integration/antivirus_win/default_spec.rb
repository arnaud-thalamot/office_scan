
# check if the directory exist for tad4d installer zipfile
describe file('C:\\officeScan_installer') do
  it { should exist }
  its('type') { should eq :directory }
  it { should be_directory }
end

# check if the package tad4d Agent package is installed
describe package('Tren Micro OfficeScan Client') do
  it { should be_installed }
  its('version') { should eq 10.6 }
end

# check if tad4d service is running and enabled
describe service('tmlisten') do
  it { should be_enabled }
  it { should be_running }
end
