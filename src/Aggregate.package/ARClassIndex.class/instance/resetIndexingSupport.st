actions
resetIndexingSupport
	"Installs a brand new indexing support"
	
	^ self currentTransaction root 
		at: self indexingSupportKey 
		put: self newIndexingSupport