accessing
at: aString ifAbsent: exceptionBlock
	aString isEmpty ifTrue: [^ emptyValue ifNil: [exceptionBlock value]].
	root ifNil: [^ exceptionBlock value].
	
	^ (root lookupString: aString startingAt: 1) ifNil: exceptionBlock