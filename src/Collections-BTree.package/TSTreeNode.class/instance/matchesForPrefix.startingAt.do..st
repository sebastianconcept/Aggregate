private
matchesForPrefix: aString startingAt: i do: aBlock
	self
		lookupString: aString
		startingAt: i
		whenFound: [value ifNotNil: [aBlock value: value].  equal ifNotNil: [equal do: aBlock]]
		whenNil: [:c | ^ self]
		recurseWith: [:n :j | n matchesForPrefix: aString startingAt: j do: aBlock]