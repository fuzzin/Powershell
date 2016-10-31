$count = 1
$ErrorArray = @()
$Filepath
$ErrorFilepath

$Total = Get-Content -Path $Filepath 
$Total = $Total.Count 

Get-Content -Path $Filepath |
ForEach-Object {

	$Error.Clear()
	Write-Host "$Count\$Total " -NoNewline
	
	#Insert AD changes here

	if ($Error){$ErrorArray += $_}
	
	$count++
}

$ErrorArray  | Out-File -FilePath $ErrorFilepath
