actions
removePreviousGeneration
	"Removes the old odb version of this odb (if present).
	Answers the size bytes that were cleaned up."
	
	^ self removeOldOdb