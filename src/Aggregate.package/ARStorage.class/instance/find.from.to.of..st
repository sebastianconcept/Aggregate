queries
find: anAggregateClass from: start to: end of: aSelector
	"Answers the aggregates of anAggregateClass
	indexed by aSelector that are from 
	the occurrence number start 
	up to the occurrence number end"

	^ (self indexFor: anAggregateClass selector: aSelector) from: start to: end for: self