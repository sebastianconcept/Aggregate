testing
isUnderMaintenance
	"Answers true if this odb is under mainteance (i.e. being garbage collected 
	or something that requires exclusive access).
	Note: this is implemented with a file presence/absence as lock so that state
	is known by any worker image trying to access it."
	
	^ self isLocked 