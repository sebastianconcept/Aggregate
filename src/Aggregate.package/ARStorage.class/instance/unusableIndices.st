accessing
unusableIndices
	"Answers the problematic indices."
	^ self indices reject:[:anIndex| 
		self isUsableIndex: anIndex]