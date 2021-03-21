$origLocaion = Get-Location
Import-Module FC_Core -DisableNameChecking -Force -ErrorAction Stop
try{
$mntPath = "$(Split-Path $PSScriptRoot -parent)\mnt\flatcar"
if(-not (Test-Path $mntPath)){
    New-Item $mntPath -ItemType Directory | Out-Null
}
cd $mntPath
git clone https://github.com/kinvolk/flatcar-release-mirror.git .

Invoke-UnixLineEndings -directory $mntPath 
}
catch{
    throw
}
finally{
    Set-Location $origLocaion
}