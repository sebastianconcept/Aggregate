accessing
at: aString ifAbsentPut: exceptionBlock
	^ self at: aString ifAbsent: [self at: aString put: exceptionBlock value]