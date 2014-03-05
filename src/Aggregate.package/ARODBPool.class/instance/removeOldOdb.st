actions
removeOldOdb
	"Removes the old odb version of this odb (if present).
	Answers the size bytes that were cleaned up."
	
	| size oldPath |

	oldPath := path parent / (path basename,'.old').
	oldPath asFileReference exists ifFalse:[
		^0].
	
	size := oldPath asFileReference allEntries inject: 0 into:[:sum  :e| sum + e size].
	oldPath asFileReference deleteAll.
		
	^ size 
