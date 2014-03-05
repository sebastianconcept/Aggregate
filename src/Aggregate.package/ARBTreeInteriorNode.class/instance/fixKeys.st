actions
fixKeys
	"Insertions and deletions use to produce splits in 
	the tree nodes that needs fixing"
	| key |
	key := (self at: 1) fixKeys.
	self firstKey = key ifFalse:[
		"Transcript show: '*'."
		keys at: 1 put: key.
		self markDirty].
	^ key