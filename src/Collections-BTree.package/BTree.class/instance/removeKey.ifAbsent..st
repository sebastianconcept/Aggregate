adding
removeKey: aMagnitude ifAbsent: aBlock
	| leaf |
	leaf := root existingLeafForKey: aMagnitude.
	leaf ifNil: [^ aBlock value].
	leaf removeKey: aMagnitude ifAbsent: [^ aBlock value].
	root := leaf root