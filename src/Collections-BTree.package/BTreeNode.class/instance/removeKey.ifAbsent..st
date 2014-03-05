removing
removeKey: aMagnitude ifAbsent: aBlock
	| index key |
	self canShrink ifFalse: [self grow].
	
	index := keys findIndexForKey: aMagnitude.
	index = 0 ifTrue: [^ aBlock value].
	key := keys at: index.
	key = aMagnitude ifFalse: [^ aBlock value].
	
	self shiftLeftTo: index.
	
	index = 1 ifTrue: [parent ifNotNil: [parent updateKey: key to: self firstKey]]