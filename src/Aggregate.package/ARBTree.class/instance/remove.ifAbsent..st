actions
remove: aMagnitude ifAbsent: aBlock
	"Removes anObject stored at aMagnitude 
	or evaluates aBlock if not found.
	If the root was changed in the remotion, 
	the tree will mark itself as dirty"
	
	| oldRoot |

	oldRoot := root.
	super removeKey: aMagnitude ifAbsent: aBlock.
	oldRoot = root ifFalse: [self markDirty]