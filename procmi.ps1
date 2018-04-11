foreach ($prosid in $args)
{
	$dato = Get-Date -Uformat %Y%m%d-%H%M%S
	$filnavn = [string]$prosid + "--" + $dato + ".meminfo"
	Write-Output "Totalt bruk av virtuelt minne: $((Get-Process -id $prosid).VM / 1Mb) MB" >> $filnavn
	Write-Output "Storrelse paa Working set: $((Get-Process -id $prosid).WS / 1Kb) KB" >> $filnavn
}
