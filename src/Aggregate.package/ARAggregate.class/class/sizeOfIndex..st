queries
sizeOfIndex: aSymbol
	"Answers the quantity of aggregates of this kind on the requested index"

	|answer|
	answer := 0.
	self aggregateClasses do:[:anActiveRecordClass|
		anActiveRecordClass == ARAggregate ifFalse:[
			answer := answer + (anActiveRecordClass basicSizeOfIndex: aSymbol)]].

	^ answer


