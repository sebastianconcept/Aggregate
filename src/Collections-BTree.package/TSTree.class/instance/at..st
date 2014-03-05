accessing
at: aString
	^ self at: aString ifAbsent: [self error: aString printString, ' not found']