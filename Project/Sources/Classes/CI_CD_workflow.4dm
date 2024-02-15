Class constructor($actions : Text)
	This:C1470.UTest:=Null:C1517
	This:C1470.actions:=$actions
	
Function execute()
	$actionsCollection:=Split string:C1554(This:C1470.actions; ";"; sk ignore empty strings:K86:1+sk trim spaces:K86:2)
	
	
	$continue:=True:C214
	For each ($action; $actionsCollection) While ($continue)
		Case of 
			: ($action="compile")
				$continue:=This:C1470.compile()
				
			: ($action="test")
				$continue:=This:C1470.test()
				
			: ($action="build")
				$continue:=This:C1470.build()
				
			: ($action="deploy")
				$continue:=This:C1470.deploy()
				
		End case 
	End for each 
	If (This:C1470.actions#"")
		QUIT 4D:C291()
	End if 
	
	
Function compile()
	var $resultCompilationText : Text
	var $path:="compilationResult.txt"
	$options:=New object:C1471("targets"; New collection:C1472())
	$resultCompilation:=Compile project:C1760($options)
	If (Caps lock down:C547)
		TRACE:C157
	End if 
	$resultCompilationText:=$resultCompilation.success ? "Syntax check passed" : "Syntax check failed"
	If ($resultCompilation.success=False:C215)
		$errors:=$resultCompilation.errors.query("isError == :1"; True:C214)
		For each ($error; $errors)
			$resultCompilationText+="\r------------------------\r"+\
				"Method: "+$error.code.path+"\r"+\
				"Line: "+String:C10($error.line)+"\r"+\
				"Message: "+$error.message
		End for each 
	End if 
	TEXT TO DOCUMENT:C1237($path; $resultCompilationText)
	SHOW ON DISK:C922($path; *)
	return $resultCompilation.success
	
Function test()
	var $path:="UTestResult.txt"
	$resultText:=This:C1470.UTest.runAllTests().resultText()
	TEXT TO DOCUMENT:C1237($path; $resultText)
	SHOW ON DISK:C922($path; *)
	return This:C1470.UTest.UTest_result.query("success == :1"; False:C215).length>0 ? False:C215 : True:C214
	
	
Function build()
	var $path:="buildResult.txt"
	$file:=File:C1566(Build application settings file:K5:60)
	BUILD APPLICATION:C871($file.platformPath)
	TEXT TO DOCUMENT:C1237($path; OK=1 ? "build passed" : "build failed")
	SHOW ON DISK:C922($path; *)
	return OK=1 ? True:C214 : False:C215
	
Function deploy()  //TEXT TO DOCUMENT("deployResult.txt"; "deploy passed")
	return True:C214