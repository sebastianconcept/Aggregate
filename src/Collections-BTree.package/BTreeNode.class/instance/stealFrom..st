private
stealFrom: aNode
	| key value |
	aNode firstKey > self firstKey
		ifTrue: [value := aNode at: 1. key := aNode firstKey]
		ifFalse:
			[aNode keysAndValuesDo: [:k :v | key := k. value := v].
			parent ifNotNil: [parent updateKey: self firstKey to: key]].
	self insertKey: key value: value.
	aNode removeKey: key