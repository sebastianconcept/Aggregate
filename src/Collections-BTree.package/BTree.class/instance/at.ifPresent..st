accessing
at: aMagnitude ifPresent: aBlock
	| leaf |
	leaf := root existingLeafForKey: aMagnitude.
	leaf ifNil: [ ^ nil ].
	^ leaf valueForKey: aMagnitude ifPresent: aBlock