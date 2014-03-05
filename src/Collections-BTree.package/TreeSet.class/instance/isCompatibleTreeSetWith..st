private
isCompatibleTreeSetWith: aCollection
	aCollection isTreeSet ifFalse: [^ false].
	aCollection equalitySelector = self equalitySelector ifFalse: [^ false].
	aCollection sortSelector = self sortSelector ifFalse: [^ false].
	^ true