private
beNew
	"Mark the receiver as new.
	WARNING: use it very wisely. 
	When saved this forces active records to be added in the storage.
	I've added this feature to be useful to migrate from 
	whatever source to a brand new repository"
	isNew := true.
	oid := nil.