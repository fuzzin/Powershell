$Filepath
$xl = New-Object -COM "Excel.Application"
$xl.Visible = $true
$wb = $xl.Workbooks.Open($Filepath)
$ws = $wb.Sheets.Item(1)
$ws2 = $wb.Sheets.Item(2) #for errors

$colDomain = "A"
$colID = "B"
$colADGroup = "C"
$colADGroup2 = "D"
$colError = "A"

$row = 1
	
$rowTotal = $ws.UsedRange.Rows.count
$rowCount = $rowTotal - $Row + 2

for ($i = 1; $i -lt $rowCount; $i++){

	$Error.Clear();

	$Domaincell = $ColDomain + $row
	$Domain = $ws.range("$Domaincell").Text.trim()	
	
	$IDcell = $ColID + $row
	$ID = $ws.range("$IDcell").Text.trim()
	
	$ADGroupcell = $colADGroup + $row
	$ADGroup = $ws.range("$ADGroup").Text.trim()
	
	$ADGroupcell2 = $colADGroup2 + $row
	$ADGroup2 = $ws.range("$ADGroup2").Text.trim()

	Write-Host "$row/$rowTotal $Domain\$ID"
	
	#Insert AD changes here

	$ws.cells.Item($row,$ColumnOutput).Value() = "$output"
	
	if ($Error){
		$ws2.cells.Item($row,$colError).Value() = $Error[0]
	}

	$row++
}
	
$xl.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($xl)

