$xl = New-Object -COM "Excel.Application"
$xl.Visible = $true
$wb = $xl.Workbooks.Open("U:\CSB\Admin\IS\SECURITY\Derek's Tools\Powershell\Shared Docs.tmp\AD Group Assignment Request DS-PWA 21060815.xlsx")
$ws = $wb.Sheets.Item(1)

$colDomain = "A"
$colID = "B"
$ColAD = "E"

$row = 4
	
$rowTotal = $ws.UsedRange.Rows.count
$rowCount = $rowTotal - $Row + 2

for ($i = 1; $i -lt $rowCount; $i++){

	$Error.Clear();

	$Domaincell = $ColDomain + $row
	$Domain = $ws.range("$Domaincell").Text.trim()
	
	$ADcell = $ColAD + $row
	$AD = $ws.range("$ADcell").Text.trim()
	
	$IDcell = $ColID + $row
	$ID = $ws.range("$IDcell").Text.trim()

	Write-Host "$row/$rowTotal $Domain\$ID"
	
		$var = Get-QADUser "$Domain\$ID"

	
		if ($var -eq $null){
		 $ws.cells.Item($row,2).EntireRow.Interior.ColorIndex = 4

		}


	$row++
}
	
#$xl.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($xl)

