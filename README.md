antivirus_win Cookbook

The Antivirus cookbook  performs silent installation of OpenScan Client 10.6 antivirus on the node.

Requirements

- Storage : 2 GB
- RAM : 2 GB
- Versions
	- Chef Development Kit Version: 0.17.17
	- Chef-client version: 12.13.37
	- Kitchen version: 1.11.1

Platforms 
    Winodws 2012

Chef
    Chef 11+

Recipe
----------------  
  - install:
    
    1. Creates necessary directories for 
	   - copying the OpenScan Client 10.6 agent Native installer
	2. Extracting the OpenScan Client 10.6 installer to fetch the required setup file for installation
	3. Install the OpenScan Client 10.6 from temporary directory
	4. Delete the temporary directory containing the files used during installation..
	

Attributes

The following attributes are set by default
 default['antivirus']['native_file'] = 'OfficeScanClient10.6SP2_64bit_ PROD.zip'   # antivirus installer native file
  default['antivirus']['temp'] = 'C:\\anti_temp\\'         # Temp file where we copy the antivirus installer
  default['antivirus']['alreadyInstalledFile'] = ''        # Installed file for antivirus agent
  default['antivirus']['install_path'] = ''                # Path for antivirus installation

