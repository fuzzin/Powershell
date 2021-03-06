Function Get-Password{
$lowercase = 'a','b','c','d','e','f','g','h','j','k','m','n','p','q','r','s','t','u','v','w','x','y','z'
$UpperCase = 'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z'
$numbers = '2','3','4','5','6','7','8','9'
$array = 'a','b','c','d','e','f','g','h','j','k','m','n','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z','2','3','4','5','6','7','8','9','@','#','$','%','&'
function checkLower{
for ($x=0; $x -lt $password.Length; $x++){
		for ($i=0; $i -le $lowercase.Length; $i++){
		$check = $password[$x] -ccontains $lowercase[$i]
			if ($check -eq $true){
			return $true
			}
		}
	}
}
function checkUpper{
for ($x=0; $x -lt $password.Length; $x++){
		for ($i=0; $i -le $uppercase.Length; $i++){
		$check = $password[$x] -ccontains $uppercase[$i]	
		if ($check -eq $true){
			return $true
			}
		}
	}
}
function numbers{
for ($x=0; $x -lt $password.Length; $x++){
		for ($i=0; $i -le $numbers.Length; $i++){
		$check = $password[$x] -ccontains $numbers[$i]	
		if ($check -eq $true){
			return $true
			}
		}
	}
}
do {
$password = ""
for ($x=0; $x -lt 8; $x++){
$rand = $array[(Get-Random -Maximum ([array]$array).count)]
$password = $password + $rand
}
}until ((checkLower -eq $true) -and (checkUpper -eq $true) -and (numbers -eq $true))

return $password
}
export-modulemember -function Get-Password
export-modulemember -function checkLower 
export-modulemember -function checkUpper 
export-modulemember -function numbers