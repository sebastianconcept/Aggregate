accessing
someAlphanumerics
	
	^ (1 to: 1000) collect:[:i|
		UUID new asString36]