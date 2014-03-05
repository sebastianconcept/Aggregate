actions
makeAggregatePersistent: anAggregate in: aContainerName
	
	self currentTransaction makePersistent: anAggregate in: aContainerName.

	"The checkpoint here is to let the transaction actually write the aggregate so it gets the
	real objectID at the container."
	self currentTransaction checkpoint.
	anAggregate setOid; markDirty
