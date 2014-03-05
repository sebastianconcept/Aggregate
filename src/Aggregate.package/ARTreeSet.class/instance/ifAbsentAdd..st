public
ifAbsentAdd: anObject

	(self includes: anObject) ifTrue:[^ nil].
	
	super add: anObject.
	
	self markDirty.
	
	^ anObject 