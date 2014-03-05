private
odbMadePersistentIn: anOmniBaseTransaction
	"This method is sent when the object is made persistent."

	self markDirty. "may be redundant, but you know.."
	
	super odbMadePersistentIn: anOmniBaseTransaction.
	
