queries
last
	"Answers the last of the active records 
	that are currently maintained by this index.
	Or.. return nil"
	^ self indexingSupport isEmpty
		ifTrue: [nil]
		ifFalse: [self indexingSupport last value first]