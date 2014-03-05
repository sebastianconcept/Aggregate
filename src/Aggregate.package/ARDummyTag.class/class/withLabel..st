accessing
withLabel: aString

	^ self findAll 
		detect:[:e| e label = aString]
		ifNone:[nil]