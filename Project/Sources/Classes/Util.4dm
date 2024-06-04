Class constructor
	
Function factorial($value : Integer)
	If ($value=0)
		return 1
	End if 
	return $value*This:C1470.factorial($value-1)
	
	
	// Spot the deliberate mistake
	
	// Function factorial($value : Integer)
	// var $i; $result : Integer
	
	// $result:=1
	
	// For ($i; 1; $value)
	// $result*=$i
	// End for 
	
	// return $value
	
	
	// Fred
	// Comment