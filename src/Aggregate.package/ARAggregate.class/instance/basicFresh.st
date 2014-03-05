accessing
basicFresh
	"Answers a fresh version of this aggregate.
	Fresh meaning that it's just read from disk (read and reified)."

	^ self isNew 
		ifTrue: [self]
		ifFalse: [self currentTransaction freshObjectAt: self odbGetOID] 