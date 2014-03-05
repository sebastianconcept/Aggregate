actions
deleteIfStored
	"Deletes this aggregate only 
	if it was previously stored."
	
	self isNew ifFalse:[
		self delete]