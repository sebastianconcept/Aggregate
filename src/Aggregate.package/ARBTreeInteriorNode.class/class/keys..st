actions
keys: anArray
	"Answers a new instance of the receiver that 
	is made persistent."
	^ (super keys: anArray)
		makePersistent;
		yourself	