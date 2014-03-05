accessing
read
	"Answers a fresh version of this aggregate.
	Fresh meaning that it's just read from disk."

	^ self isNew 
		ifTrue: [self]
		ifFalse: [self currentTransaction freshObjectAt: self odbGetOID] 