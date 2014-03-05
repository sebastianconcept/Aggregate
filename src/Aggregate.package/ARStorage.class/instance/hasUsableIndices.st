testing
hasUsableIndices
	"Answers true if all the indices in the receiver are usable"
	^ self indices values allSatisfy:[:anIndex| 
		self isUsableIndex: anIndex]