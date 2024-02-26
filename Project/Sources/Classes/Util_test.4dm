Class constructor
	This:C1470.UTest:=cs:C1710.UTest.new()
	This:C1470.sut:=cs:C1710.Util.new()
	This:C1470.testMethods:=New collection:C1472("fact_test")
	
	
Function fact_test()
	$result:=This:C1470.sut.factorial(1)
	This:C1470.UTest\
		.describe("test factorial function with parameter 1")\
		.expect($result)\
		.toBe(1)
	
	$result:=This:C1470.sut.factorial(3)
	This:C1470.UTest\
		.describe("test factorial function with parameter 3")\
		.expect($result)\
		.toBe(6)
	
	$result:=This:C1470.sut.factorial(5)
	This:C1470.UTest\
		.describe("test factorial function with parameter 5")\
		.expect($result)\
		.toBe(120)
	
	
	
	
	
	