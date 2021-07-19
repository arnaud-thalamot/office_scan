# antivirus installer native file
native_file = 'OfficeScanClient10.6SP2_64bit_PROD.msi'
# antivirus installer native file
url = 'https://client/ibm/windows2012R2/antivirus'
# Temp file where we copy the antivirus installer
temp = 'C:\\officeScan_installer\\'
# Installed file for antivirus agent
already_installed_file = 'C:\\Program Files (x86)\\Trend Micro\\OfficeScan Client\\ntreg'

# Install Antivirus for windows
if platform_family?('windows')
  if ::File.exist?("#{already_installed_file}")
    Chef::Log.info('antivirus is already install, nothing to install for OfficeScan Client')
  else
    # Create temp directory where we copy/create source files to install tad4d agent
    directory "#{temp}" do
      action :create
    end

    # get antivirus installer media to our temp dir
    media = "#{temp}\\#{native_file}"
    Chef::Log.info("media: #{media}")

    remote_file "#{media}" do
      source "#{url}/#{native_file}"
      action :create_if_missing
    end

    Chef::Log.info('Performing antivirus installation...')

    windows_package 'trend-install' do
      source 'c:\officeScan_installer\OfficeScanClient10.6SP2_64bit_PROD.msi'
      installer_type :custom
      options '/qn /l*v C:\TrendAgent.log'
   end
    
    # Deleting the Temp file
    directory temp.to_s do
      recursive true
      action :delete
    end

    powershell_script 'trigger-scan' do
        code <<-EOH
        cd 'C:/Program Files (x86)/Trend Micro/OfficeScan Client'
        start-process -filepath 'pccnt.exe' -ArgumentList 'C:'
        Start-Sleep -s 300
        EOH
    end

    node.set['antivirus']['status'] = 'succcess'
  end
end
