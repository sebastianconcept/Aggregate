accessing
childForKey: aMagnitude
	| index |
	index := keys findIndexForKey: aMagnitude.
	index = 0 ifTrue:
		[self markDirty.
		keys at: 1 put: aMagnitude.
		^ self at: 1].
	^ self at: index
		
