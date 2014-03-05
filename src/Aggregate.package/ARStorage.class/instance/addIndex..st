actions
addIndex: anIndex
	"Adds anIndex to this storage.
	It'll be installed in the repository"
	| containerName |

	(self isIndexing: anIndex aggregateClass with: anIndex selector) ifTrue:[
		self error: 'Hey, that index is already in the store.'].
	
	containerName := containerPolicy containerNameForIndex: anIndex in: self.
	
	ARCurrentContainer use: containerName during:[
		self currentTransaction 
			makePersistent: anIndex 
			in: containerName.

		(self indices 
			at: anIndex aggregateClassName 
			ifAbsentPut:[
				self currentTransaction 
					makePersistent: OrderedCollection new
					in: containerName]) add: anIndex; markDirty.
		anIndex resetIndexingSupport.
		self currentTransaction 
			makePersistent: anIndex indexingSupport
			in: containerName.
		self markDirty]