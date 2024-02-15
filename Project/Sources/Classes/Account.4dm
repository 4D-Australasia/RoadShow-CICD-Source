Class constructor
	This:C1470.owner:={id: 1; isAdmin: False:C215}
	This:C1470.httpClient:=Null:C1517
	
Function isUserOwner($user : Object)
	return This:C1470.owner.id=$user.id
	
Function canResetPassword($user : Object)->$cancel : Boolean
	
	Case of 
		: ($user.isAdmin)
			$cancel:=True:C214
			
		: (This:C1470.isUserOwner($user))
			$cancel:=True:C214
			
		Else 
			$cancel:=False:C215
	End case 
	
	
Function AcanResetPassword($user : Object)
	
	If ($user.isAdmin)
		return (True:C214)
	End if 
	
	If (This:C1470.isUserOwner($user))
		return (True:C214)
	End if 
	
	return (False:C215)
	
Function ZZcanResetPassword($user : Object)
	
	If ($user.isAdmin)
		return (True:C214)
	Else 
		If (This:C1470.isUserOwner($user))
			return (True:C214)
		Else 
			return (False:C215)
		End if 
	End if 
	
	
Function EcanResetPassword($user : Object)
	return $user.isAdmin || This:C1470.isUserOwner($user) ? False:C215 : True:C214
	
	
Function isRedFlag($url)
	$account:=This:C1470.httpClient.getGithubAccount($url)
	If ($account.open_issues_count#Null:C1517) && ($account.open_issues_count>14)
		return True:C214
	End if 
	return False:C215
	
	
	