actions
removeIndex: anIndex
	"Removes anIndex from this storage"
	| containerName |
	
	containerName := containerPolicy containerNameForIndex: anIndex in: self.

	ARCurrentContainer use: containerName during:[
		(self indices 
			at: anIndex aggregateClassName
			ifAbsent:[^nil]) remove: anIndex; markDirty.
		self indices markDirty.
		anIndex removeIndexingSupport.
		self markDirty]