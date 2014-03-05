adding
removeKey: aTimespan
	self removeKey: aTimespan ifAbsent: [ self error: aTimespan printString, ' not found' ].