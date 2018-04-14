
<#PSScriptInfo

.VERSION 1.0

.GUID de966cbe-e588-474c-a81f-9ea5b979f65a

.AUTHOR iguatemi@gmail.com

.COMPANYNAME 

.COPYRIGHT 

.TAGS 

.LICENSEURI 

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES


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