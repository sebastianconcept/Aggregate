initializing
initializeWithKeys: aBtreeKeys sortSelector: sortSymbol equalitySelector: equalsSymbol

	self makePersistent.
	self setTree: (ARBTree keys: aBtreeKeys) sortSelector: sortSymbol equalitySelector: equalsSymbol.
	self markDirty.