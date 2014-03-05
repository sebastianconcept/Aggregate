queries
find: anAggregateClass where: aSelectorSymbol includes: aValue
	"Answers the instances of anAggregateClass who's
	aSelectorSymbol includes aValue (among many others). 
	Or.. nil if not found."

	^ (self indexFor: anAggregateClass selector: aSelectorSymbol) includes: aValue for: self