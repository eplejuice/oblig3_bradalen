Navn: Martin Brådalen

Studentnr: 473145

Klasse: 16HBITSECA

# IMT2282 Operativsystemer: Oblig 3 - Programmering i PowerShell.


## Alle ps1 filer kan kjøres ved å først tillate kjøring av scripts i PowerShell.
     PowerShell -> Run as administrator
     Set-ExecutionPolicy RemoteSigned
     Install-PackageProvider Chocolatey
     Restart PowerShell -> Run as administrator

## Så kjøre filen med:
    ./<filename>

## Alle filene har blitt kvalitetssikret med PSScriptAnalyzer
[GitHub](https://github.com/PowerShell/PSScriptAnalyzer)
    
    Install-Module -Name PSScriptAnalyzer
    Invoke-ScriptAnalyzer <filename>
