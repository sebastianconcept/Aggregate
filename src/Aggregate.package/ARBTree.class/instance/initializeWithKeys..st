initializing
initializeWithKeys: aBTreeKeys

	aBTreeKeys size > 3 ifFalse: [self error: 'The BTree order must be at least 4'].
	root := ARBTreeLeafNode keys: aBTreeKeys.
	self makePersistent