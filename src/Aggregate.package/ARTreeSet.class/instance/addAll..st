public
addAll: aCollection
	
	super addAll: aCollection.
	
	self markDirty.
	
	^ aCollection 