accessing
removeKey: aString
	^ self removeKey: aString ifAbsent: [self error: 'Could not find key ', aString printString]