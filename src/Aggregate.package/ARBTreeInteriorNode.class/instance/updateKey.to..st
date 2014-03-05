actions
updateKey: oldMagnitude to: newMagnitude
	"Updates the node (or some parent's)
	regarding to old a new magnitudes.
	It requires a mark dirty to be persisted."

	self markDirty.
	^ super updateKey: oldMagnitude to: newMagnitude