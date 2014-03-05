private
removeString: aString startingAt: i
	| val |
	self
		lookupString: aString
		startingAt: i
		whenFound: [val := self value. self value: nil]
		whenNil: [:c | ^ nil]
		recurseWith:
			[:node :j |
			val := node removeString: aString startingAt: j.
			node canBeCulled ifTrue:
				[self cullNode: node]].
	^ val