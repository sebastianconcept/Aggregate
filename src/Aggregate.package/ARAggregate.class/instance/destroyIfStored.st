actions
destroyIfStored
	"Destroys this aggregate only 
	if it was previously stored."
	
	self onAboutToDestroy.

	self isNew ifTrue:[^self].

	[:storedOrNil|
		storedOrNil ifNotNil:[
			self storage remove: storedOrNil]] value: self fresh	realPersistent
	