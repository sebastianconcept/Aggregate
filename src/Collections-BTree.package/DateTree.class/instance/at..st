accessing
at: aTimepan
	^ self at: aTimepan ifAbsent: [ self error: aTimepan printString, ' not found' ]