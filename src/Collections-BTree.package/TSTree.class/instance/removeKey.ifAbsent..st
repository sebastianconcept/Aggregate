accessing
removeKey: aString ifAbsent: errorBlock
	| val |
	^ root ifNil: errorBlock
		ifNotNil:
			[val := root removeString: aString startingAt: 1.
			root canBeCulled ifTrue: [root := nil].
			val ifNil: errorBlock]