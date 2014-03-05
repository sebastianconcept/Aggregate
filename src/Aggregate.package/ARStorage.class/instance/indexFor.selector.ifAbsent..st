accessing
indexFor: anAggregateClass selector: aSelectorSymbol ifAbsent: aBlock
	"Answers the index that is the maintainer
	of anAggregateClass kind of aggregates on aSelectorSymbol values"

	^ [:indices|
		indices ifNil:[ARNoIndexForAggregate signal].
		indices 
			detect: [:anIndex| anIndex selector = aSelectorSymbol]
			ifNone: aBlock] value: (self indicesFor: anAggregateClass)
