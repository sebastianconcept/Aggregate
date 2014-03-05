accessing
keySize: anInteger
	
	anInteger < 5 ifTrue:[self error: 'Key is too small'].
	anInteger > 255 ifTrue:[self error: 'Key is too big'].
	
	keySize := anInteger
	