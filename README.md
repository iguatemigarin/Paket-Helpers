# Home of Paket Helpers for PowerShell

## Installation

Admin

    PS> Install-Script -Name Paket-Helpers ; Add-Content $PROFILE "`n. Paket-Helpers.ps1`n" ; . Paket-Helpers.ps1

Current User
    
    PS> Install-Script -Name Paket-Helpers -Scope CurrentUser; Add-Content $PROFILE "`n. Paket-Helpers.ps1`n" ; . Paket-Helpers.ps1

## Commands

### Paket-Install

Install stable build of paket in local folder eg.: .\\.paket\paket.exe

### paket

Run paket commands. Asks to install paket if .\\.paket\paket.exe is not found in current directory

    PS> paket init
    PS> paket install
