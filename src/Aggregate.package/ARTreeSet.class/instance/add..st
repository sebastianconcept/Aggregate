public
add: anObject

	super add: anObject.
	
	self markDirty.
	
	^ anObject 