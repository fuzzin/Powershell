$count = 1
$ErrorArray = @()

Get-Content -Path "U:\CSB\Admin\IS\SECURITY\Derek's Tools\Powershell\Templates\txt_loop.txt" |
ForEach-Object {

	$Error.Clear()
	Write-Host $count
	
	Deprovision-QADUser $_

	if ($Error){$ErrorArray += $_}
	
	$count++
}

$ErrorArray  | Out-File -FilePath "U:\CSB\Admin\IS\SECURITY\Derek's Tools\Powershell\Templates\Error Logs\MOSTL_Terms_10.13.txt"
