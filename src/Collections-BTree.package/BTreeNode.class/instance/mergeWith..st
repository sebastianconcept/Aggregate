private
mergeWith: aNode		
	| oldKey |
	oldKey := self firstKey.
	aNode keysAndValuesDo:
		[:k :v |
		self insertKey: k value: v].
	parent removeKey: aNode firstKey.
	parent updateKey: oldKey to: self firstKey.