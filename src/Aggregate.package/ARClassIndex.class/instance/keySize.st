accessing
keySize
	
	^ keySize ifNil:[self initializeKeySize]
	