# Install from the PowerShell Gallery

Install-Module -Name UniversalAutomation -AllowPrerelease
Install-Module -Name UniversalAutomation.Dashboard -AllowPrerelease


# You might need some updates first...
# https://www.thomasmaurer.ch/2019/02/update-powershellget-and-packagemanagement/

Install-PackageProvider Nuget –Force

## Close and re-open PowerShell

Install-Module –Name PowerShellGet –Force -AllowClobber
