 	
function Get-NextID{
param ($FirstName, $LastName)

$strFirstName = $FirstName
$strFirstName = $strFirstName.Replace("-", "")
$strFirstName = $strFirstName.Replace( "'", "")
$strFirstName = $strFirstName.Replace("~", "")
#$strFirstName = $strFirstName.Replace("`", "")
$strFirstName = $strFirstName.Replace(" ", "")

$strLastName = $LastName
$strLastName = $strLastName.Replace("-", "")
$strLastName = $strLastName.Replace("'", "")
$strLastName = $strLastName.Replace("~", "")
#$strLastName = $strLastName.Replace("`", "")
$strLastName = $strLastName.Replace(".", "")
$strLastName = $strLastName.Replace("^", "")
$strLastName = $strLastName.Replace(" ", "")

$strLastName = $strLastName.ToLower()
$strFirstName = $strFirstName.ToLower()

GenerateID -FirstName $strFirstname -LastName $strLastName

}
Function IsUnique{
param($username)
$firstID=""
Clear-Variable -Name firstid
$firstID = Get-QADUser -SamAccountName $username
if (($firstID -eq $null)){
Write-Host "$username not found"
$false
}else{
Write-Host "found $firstID"
$true
}
}

function GenerateID{
param ($FirstName,$LastName)
$num=1

$count = $LastName | measure-object -Character
if ($count.Characters -lt 4){
	$Userid= $FirstName.substring(0,1) + $LastName
	}else{
	$Userid= $FirstName.substring(0,1) + $LastName.substring(0,4)
}

do{
$numzeros="0" -as [string]
if	($num -lt 10){$ID = $Userid + $numzeros + $numzeros + $num}
if	($num -ge 10){$ID = $Userid + $numzeros + $num}
if	($num -ge 100){$ID = $Userid + $num}
$num++
}until ((IsUnique -username $ID)-eq $false)
return $ID
}


export-modulemember -function GenerateID 
export-modulemember -function Get-NextID 
export-modulemember -function IsUnique 
