private
newIndexingSupport
	"Answers a new instance of something to aid indexing"
		
	^ OmniBase newBTreeDictionary: self keySize
	
	"^ OmniBase newBTreeIdentityDictionary makePersistent "
	"^ ARBTree order: 32"