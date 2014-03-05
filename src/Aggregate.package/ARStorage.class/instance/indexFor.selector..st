accessing
indexFor: anAggregateClass selector: aSelectorSymbol
	"Answers the index that is the maintainer
	of anAggregateClass kind of aggregates on aSelectorSymbol values"

	^ self 
		indexFor: anAggregateClass
		selector: aSelectorSymbol 
		ifAbsent:[ARNoIndexForAttribute signal] 