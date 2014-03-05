matching
matchesForPrefix: aString do: aBlock
	aString isEmpty
		ifTrue: [self do: aBlock]
		ifFalse: [root ifNotNil: [root matchesForPrefix: aString startingAt: 1 do: aBlock]]