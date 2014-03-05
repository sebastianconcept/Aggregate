actions
removeIndexingSupport
	"Removes the indexing support (if any)"
	
	^ self currentTransaction root 
		removeKey: self indexingSupportKey 
		ifAbsent: nil