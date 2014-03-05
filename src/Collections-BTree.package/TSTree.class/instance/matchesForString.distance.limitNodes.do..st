matching
matchesForString: aString distance: aNumber limitNodes: maxNodes do: aBlock
	| nodeCount |
	nodeCount := 0.
	aString isEmpty ifTrue: [^ self].
	root isNil ifTrue: [^ self].
	root matchesForString: aString startingAt: 1 distance: aNumber do: aBlock nodesDo:
		[:ea |
		nodeCount := nodeCount + 1.
		nodeCount = maxNodes ifTrue: [^ self]]