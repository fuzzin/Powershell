﻿$count = 1
$ErrorArray = @()
$Filepath
$ErrorFilepath

Get-Content -Path $Filepath |
ForEach-Object {

	$Error.Clear()
	Write-Host $count
	
	#Insert AD changes here

	if ($Error){$ErrorArray += $_}
	
	$count++
}

$ErrorArray  | Out-File -FilePath $ErrorFilepath
