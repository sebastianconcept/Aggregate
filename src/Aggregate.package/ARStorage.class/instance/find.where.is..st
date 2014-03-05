queries
find: anAggregateClass where: aSelectorSymbol is: aValue
	"Answers the instance of anAggregateClass who's
	aSelectorSymbol answers aValue. 
	Or.. nil if not found."

	^ (self indexFor: anAggregateClass selector: aSelectorSymbol) at: aValue for: self