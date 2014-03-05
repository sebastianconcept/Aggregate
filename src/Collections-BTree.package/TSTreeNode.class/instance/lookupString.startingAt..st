private
lookupString: aString startingAt: i
"inlined for performance"
"
	self
		lookupString: aString
		startingAt: i
		whenFound: [^ value]
		whenNil: [:c | ^ nil]
		recurseWith: [:node :j | ^ node lookupString: aString startingAt: j]"
	| char |
	char := aString at: i.
	char = key
		ifTrue:
			[aString size = i
				ifTrue: [^ value]
				ifFalse: [^ equal ifNotNil: [equal lookupString: aString startingAt: i+1]]]
		ifFalse:
			[char < key
				ifTrue: [^ low ifNotNil: [low lookupString: aString startingAt: i]]
				ifFalse: [^ high ifNotNil: [high lookupString: aString startingAt: i]]]