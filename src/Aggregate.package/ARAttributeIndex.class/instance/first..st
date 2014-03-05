queries
first: anInteger
	"Answers the firsts anInteger aggregates
	that are currently maintained by this index.
	Or.. return an empty bunch"

	^ self indexingSupport isEmpty
		ifTrue: [#()]
		ifFalse: [(self indexingSupport first: anInteger) collect:[:e| e first]]