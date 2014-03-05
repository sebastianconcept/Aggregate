private
lookupString: aString startingAt: i whenFound: foundBlock whenNil: nilBlock recurseWith: recurseBlock
	| char |
	char := aString at: i.
	char = key
		ifTrue:
			[aString size = i
				ifTrue: [foundBlock value]
				ifFalse: [equal ifNil: [equal := nilBlock value: (aString at: i+1)].
						 recurseBlock value: equal value: i+1]]
		ifFalse:
			[char < key
				ifTrue: [low ifNil: [low := nilBlock value: char].
						recurseBlock value: low value: i]
				ifFalse: [high ifNil: [high := nilBlock value: char].
						recurseBlock value: high value: i]]