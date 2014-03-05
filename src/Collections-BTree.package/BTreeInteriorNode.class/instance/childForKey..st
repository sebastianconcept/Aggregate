as yet unclassified
childForKey: aMagnitude
	| index |
	index := keys findIndexForKey: aMagnitude.
	index = 0 ifTrue:
		[keys at: 1 put: aMagnitude.
		^ self at: 1].
	^ self at: index
		
