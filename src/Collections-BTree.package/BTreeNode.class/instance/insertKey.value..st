inserting
insertKey: aMagnitude value: anObject
	| index key |
	index := keys findIndexForKey: aMagnitude.
	index = 0 ifTrue:
		[self canGrow
			ifTrue:
				[self shiftRightFrom: 1.
				^ self insertKey: aMagnitude value: anObject at: 1]
			ifFalse:
				[self split.
				^ (parent childForKey: aMagnitude) insertKey: aMagnitude value: anObject]].
	
	key := keys at: index.
	key = aMagnitude ifTrue:
		[^ self insertKey: aMagnitude value: anObject at: index].
	index < self size ifTrue:
		[key := keys at: index + 1.
		key
			ifNil: [^ self insertKey: aMagnitude value: anObject at: index+1]
			ifNotNil:
				[self canGrow ifTrue:
					[self shiftRightFrom: index+1.
					^ self insertKey: aMagnitude value: anObject at: index+1]]].

	"otherwise"
	self split.
	^ (parent childForKey: aMagnitude) insertKey: aMagnitude value: anObject