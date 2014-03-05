actions
at: aMagnitude put: anObject
	"Stores anObject using aMagnitude to locate it.
	The tree's change demads a mark dirty to be written"

	self markDirty.
	^ super at: aMagnitude put: anObject