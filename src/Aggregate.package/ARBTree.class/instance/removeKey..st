actions
removeKey: aMagnitude
	"Removes anObject stored at aMagnitude.
	If the root was changed in the remotion, 
	the tree will mark itself as dirty"
	
	| oldRoot |
	oldRoot := root.
	super removeKey: aMagnitude.
	oldRoot = root ifFalse: [self markDirty]