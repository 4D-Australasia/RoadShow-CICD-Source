


Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		$ptr_airport_from:=OBJECT Get pointer:C1124(Object named:K67:5; "airport_from")
		Form:C1466.arrival:=Form:C1466.arrivals[$ptr_airport_from->-1]
End case 