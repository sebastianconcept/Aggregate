accessing
at: aString put: anObject
	aString isEmpty ifTrue: [^ emptyValue := anObject].
	root ifNil: [root := TSTreeNode key: aString first].
	root lookupString: aString startingAt: 1 insert: anObject.
	^ anObject