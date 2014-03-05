actions
fixKeys
	"Insertions and deletions use to produce splits in 
	the tree nodes that needs fixing.
	Interior nodes fix expects leaf to return the first key on fixKeys"
	^ self firstKey