private
lookupString: aString startingAt: i insert: anObject
	self
		lookupString: aString
		startingAt: i
		whenFound: [self value: anObject]
		whenNil: [:c | self newNodeWithKey: c]
		recurseWith: [:node :j | node lookupString: aString startingAt: j insert: anObject]