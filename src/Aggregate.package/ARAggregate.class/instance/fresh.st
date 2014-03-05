accessing
fresh
	"Answers this aggregate taken from the current transaction."

	self resetOID.

	^ self isNew 
		ifTrue: [self]
		ifFalse: [|theOid|
			theOid := self odbGetOID.
			theOid isNil 
				ifFalse: [self currentTransaction objectAt: theOid]
				ifTrue:[self freshAt]] 