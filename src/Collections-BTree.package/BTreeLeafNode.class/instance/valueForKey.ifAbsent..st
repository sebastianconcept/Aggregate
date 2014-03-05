as yet unclassified
valueForKey: aMagnitude ifAbsent: errorBlock
	| i |
	i := keys findIndexForKey: aMagnitude.
	^ (i > 0 and: [(keys at: i) = aMagnitude])
		ifTrue: [self at: i]
		ifFalse: [errorBlock value]
