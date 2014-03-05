queries
includes: anObject for: aStorage
	"Answers the active records found in this index related 
	to the 'value' anObject or an empty array if none found"

	(allowsNil not and:[
	anObject isNil]) ifTrue:[
		"This index don't allow nil values so it can't 
		answer consistently when is asked about a nil value"
		^ ARCantIndexNil signal].
	
	^ ARCurrentContainer use: (aStorage containerNameForAttributeIndex: self) during:[|results|
		results := self readOnlySetForValue: anObject.
		results isNil
			ifTrue:[#()]
			ifFalse: [results]]