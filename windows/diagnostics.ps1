<#
Copyright (c) 2017 All Rights Reserved, http://www.threatstack.com

.SYNOPSIS
Collect audit policy settings, logs and configuration data related to the Threat Stack Windows Agent

.DESCRIPTION
This is a simple tool to collect data related to the Threat Stack Windows Agent to help support personnel diagnose problems with the installed agent.
#>

# Make a directory name
$currentTime = get-date -format yyyy-MM-dd-HHmmss
$hostname = Hostname
$diagnosticsDir = "TSLogs" + "_" + $hostname + "_" + $currentTime
$fullpath = "$PSScriptRoot\$diagnosticsDir"

#Write-Output "The full path is: $fullpath"

New-Item "$fullpath" -ItemType Directory | Out-Null

# Get the install directory
$pathTSKey = 'HKLM:\SOFTWARE\Threat Stack\Threat Stack Agent'
$installLocation = (Get-ItemProperty -Path $pathTSKey -Name InstallLocation).InstallLocation
$installLocation = $installLocation.Substring(0, $installLocation.Length - 1)
#Write-Output "The installation location is: $installLocation"
$diagnosticsZipFile = "$diagnosticsDir.zip"

# Create a place to zip files
cd ".\$diagnosticsDir"

if ($installLocation -eq "")
{
    $message = "Warning: the agent is not installed"
    $message | Out-File 'status.txt'
    $message
}
else
{
    #$message = "The installation directory is: " + $installLocation
    $message | Out-File 'status.txt'
    & "$installLocation\threatstack_agent.exe" status >> status.txt
    & "$installLocation\threatstack_agent.exe" log >> status.txt
    New-Item "logs" -ItemType Directory | Out-Null
    New-Item "etc" -ItemType Directory | Out-Null
    # Copy files
    Copy-Item "$installLocation\logs\*" ".\logs"
    Copy-Item "$installLocation\etc\*" ".\etc"
}

& auditpol.exe /get /category:"Logon/Logoff" > policies.txt
& auditpol.exe /get /category:"Object Access" >> policies.txt
& auditpol.exe /get /category:"Detailed Tracking" >> policies.txt
& auditpol.exe /get /category:"Account Logon" >> policies.txt

# Zip It!
cd ..
## Add the assembly that contains teh Zipfile.NET framework class and call the
## CreateFromDirectory method to create the zip file.
Add-Type -assembly "system.io.compression.filesystem"
$compressionLevel= [System.IO.Compression.CompressionLevel]::Optimal
$includeBaseDirectory = $false
[io.compression.zipfile]::CreateFromDirectory("$fullpath", "$PSScriptRoot\$diagnosticsZipFile", $compressionLevel, $includeBaseDirectory)

# Clean up $diagnosticsDir
Remove-Item "$fullpath" -recurse
