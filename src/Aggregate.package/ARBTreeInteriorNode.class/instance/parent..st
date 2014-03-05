actions
parent: aNode
	"Changes the parent of this node.
	It requires a mark dirty to be persisted."
	
	super parent: aNode.
	self markDirty