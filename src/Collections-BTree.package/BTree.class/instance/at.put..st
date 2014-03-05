adding
at: aMagnitude put: anObject
	| leaf |
	leaf := root leafForKey: aMagnitude.
	leaf insertKey: aMagnitude value: anObject.
	root := leaf root.
	^ anObject