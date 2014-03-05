public
remove: anObject
	
	super remove: anObject.
	
	self markDirty.
	
	^ anObject 