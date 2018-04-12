function meny {

Write-Output "1 - Hvem er jeg og hva er navnet pa dette scriptet?"
Write-Output "2 - Hvor lenge er det siden siste boot?"
Write-Output "3 - Hvor mange prosesser og trader finnes?"
Write-Output "4 - Hvor mange context switcher fant sted siste sekund?"
Write-Output "5 - Hvor stor andel av CPU-tiden ble benyttet i kernelmode og i usermode siste sekund?"
Write-Output "6 - Hvor mange interrupts fant sted siste sekund?"
Write-Output "9 - Avslutt dette scriptet"
Write-Output     "Velg en funksjon:"
}


Function GetUptime {
$temp = Get-Ciminstance win32_operatingsystem
$otid = (Get-Date) - $temp.LastBootUpTime
Write-Output "Oppetid: $($otid.Days) dager  $($otid.Hours) timer  $($otid.Minutes) minutter"
}

Function KernelUserTime {
$kerneltime = (Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation | Where-Object {$_.Name -eq "_Total"}).PercentPrivilegedTime
$usertime = (Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation | Where-Object {$_.Name -eq "_Total"}).PercentUserTime
Write-Output "Prosent brukt i kernel time: $kerneltime og prosent brukt i user time $usertime"
}

Function InterruptsSisteSekund {
Write-Output "Antall interrupts siste sekund: $((Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation | Where-Object {$_.Name -eq "_Total"}).InterruptsPersec)"
}

Function KontekstvekslingerSisteSekund {
Write-Output "Antall kontekstvekslinger siste sekund: $(Get-CimInstance Win32_PerfFormattedData_PerfOS_System | Select-Object -ExpandProperty ContextSwitchesPerSec | out-string)"
}


DO
{

meny 
$svar = Read-Host

        switch ($svar)
        {
                1 { Write-Output "Jeg er $env:UserName og denne filen heter $MyInvocation.MyCommand.Name" }
                2 { GetUptime }
                3 { Write-Output "Antall prosesser: $((Get-Process).count)  Antall traader: $((Get-CimInstance win32_thread).count)" }
		4 { KontekstvekslingerSisteSekund }
		5 { KernelUserTime }
		6 { InterruptsSiste-Sekund }
        }
} While($svar -ne 9)

