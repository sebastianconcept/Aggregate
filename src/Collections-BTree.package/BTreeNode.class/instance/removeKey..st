removing
removeKey: aMagnitude
	self removeKey: aMagnitude ifAbsent: [self error: aMagnitude printString, ' not found.'].