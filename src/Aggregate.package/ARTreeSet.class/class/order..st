accessing
order: anInteger

	^ self basicNew 
		initializeWithKeys: (ARBTreeKeysArray new: anInteger) 
		sortSelector: self defaultSortSelector
		equalitySelector: self defaultEqualitySelector 
	