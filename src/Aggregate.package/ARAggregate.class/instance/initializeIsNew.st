initialization
initializeIsNew
	"Answers true if the receiver is an aggregate not saved yet)"
	^ isNew := self odbGetOID notNil