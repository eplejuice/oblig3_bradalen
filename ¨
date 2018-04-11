function meny {

Write-Host 1 - Hvem er jeg og hva er navnet pa dette scriptet?
Write-Host 2 - Hvor lenge er det siden siste boot?
Write-Host 3 - Hvor mange prosesser og trader finnes?
Write-Host 4 - Hvor mange context switcher fant sted siste sekund?
Write-Host 5 - Hvor stor andel av CPU-tiden ble benyttet i kernelmode og i usermode siste sekund?
Write-Host 6 - Hvor mange interrupts fant sted siste sekund?
Write-Host 9 - Avslutt dette scriptet
Write-Host     Velg en funksjon: `n
}


Function Get-Uptime {
$temp = Get-WmiObject win32_operatingsystem -ErrorAction SilentlyContinue
$otid = (Get-Date) - $temp.ConvertToDateTime($temp.LastBootUpTime)
Write-Output ("Oppetid: " + $otid.Days + " dager " + $otid.Hours + " timer " + $otid.Minutes + " minutter" ) `n
}

Function Kernel-User-Time {
$kerneltime = (Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation | Where-Object {$_.Name -eq "_Total"}).PercentPrivilegedTime
$usertime = (Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation | Where-Object {$_.Name -eq "_Total"}).PercentUserTime
Write-Host Prosent brukt i kernel time: $kerneltime og prosent brukt i user time $usertime `n
}

Function Interrupts-Siste-Sekund {
Write-Host Antall interrupts siste sekund: $((Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation | Where-Object {$_.Name -eq "_Total"}).InterruptsPersec) `n
}

Function Kontekstvekslinger-Siste-Sekund {
Write-Host Antall kontekstvekslinger siste sekund: $(Get-CimInstance Win32_PerfFormattedData_PerfOS_System | Select-Object -ExpandProperty ContextSwitchesPerSec | out-string)
}


DO
{

meny 
$svar = Read-Host

        switch ($svar)
        {
                1 { Write-Host Jeg er $env:UserName og denne filen heter $MyInvocation.MyCommand.Name `n }
                2 { Get-Uptime }
                3 { Write-Host Antall prosesser: $((Get-Process).count)  Antall traader: $((Get-CimInstance win32_thread).count)`n }
		4 { Kontekstvekslinger-Siste-Sekund }
		5 { Kernel-User-Time }
		6 { Interrupts-Siste-Sekund }
        }
} While($svar -ne 9)

