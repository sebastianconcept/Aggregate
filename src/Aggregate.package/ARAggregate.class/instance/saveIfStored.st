actions
saveIfStored
	"Saves the receiver only if the aggregate 
	was previously stored."
	
	self isNew ifFalse:[
		self save]