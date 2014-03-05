accessing
freshAt
	"Answers this aggregate in the current transaction.
	Note hat, unless this isNew,  it's fetched by the #id index"

	^ self isNew 
		ifTrue: [self]
		ifFalse: [self class atId: self id]