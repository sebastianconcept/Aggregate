accessing
at: aMagnitude
	^ self at: aMagnitude ifAbsent: [self error: aMagnitude printString, ' not found']