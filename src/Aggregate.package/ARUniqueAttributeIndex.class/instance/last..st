queries
last: anInteger
	"Answers the lasts anInteger aggregates
	that are currently maintained by this index.
	Or.. return an empty bunch"

	^ self indexingSupport isEmpty
		ifTrue: [#()]
		ifFalse: [self indexingSupport last: anInteger]