initializing
initialize

	super initialize.
	
	containerPolicy := self class defaultContainerPolicy new.
	self root at: #indices put: (OmniBase newBTreeDictionary: 32) makePersistent.
	self makePersistent 