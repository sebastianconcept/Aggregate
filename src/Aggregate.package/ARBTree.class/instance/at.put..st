actions
at: aMagnitude put: anObject
	"Stores anObject using aMagnitude to locate it.
	If the root was changed (some insertions need that), 
	the tree will mark itself as dirty"
	| oldRoot |

	oldRoot := root.
	super at: aMagnitude put: anObject.

	oldRoot = root ifFalse: [self markDirty].
	^ anObject