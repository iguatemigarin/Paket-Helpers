
<#PSScriptInfo

.VERSION 1.0.1

.GUID de966cbe-e588-474c-a81f-9ea5b979f65a

.AUTHOR Iguatemi Garin <iguatemi@gmail.com>

.COMPANYNAME 

.COPYRIGHT 

.TAGS Paket Package Manager NuGet

.LICENSEURI  http://unlicense.org/UNLICENSE

.PROJECTURI https://github.com/iguatemigarin/Paket-Helpers

.ICONURI https://fsprojects.github.io/Paket/img/logo.png

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES Install-Script -Name Paket-Helpers ; Add-Content $PROFILE "`n. Paket-Helpers.ps1`n" ; . Paket-Helpers.ps1

#>

<# 

.DESCRIPTION 
 Helper functions for Paket 

#> 
Param()


Function Paket-Install {
    Set-PSDebug -Trace 0
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    New-Item -ItemType Directory -Force -Path '.\.paket'
    Invoke-WebRequest (Invoke-WebRequest 'http://fsprojects.github.io/Paket/stable').ToString() -OutFile '.\.paket\paket.exe'
}

Function paket {
    if (Test-Path '.\.paket\paket.exe') {
        .\.paket\paket.exe $args
    } else {
        $shouldInstall = Read-Host -Prompt 'No .paket\paket.exe found. Do you want to install paket in the current folder? [y/N]'
        if ($shouldInstall -eq 'y') {
            Paket-Install
            paket $args
        }
    }
}