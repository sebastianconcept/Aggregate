initialize-release
initializeWithKeys: aBTreeKeys
	aBTreeKeys size > 3 ifFalse: [self error: 'The BTree order must be at least 4'].
	root := BTreeLeafNode keys: aBTreeKeys