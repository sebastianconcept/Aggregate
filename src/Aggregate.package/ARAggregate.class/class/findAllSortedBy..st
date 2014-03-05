queries
findAllSortedBy: aSelector
	"Answers all instances or ans empty set.
	Note: this is only a good idea when you have very few of this objects
	and starts to become a REALLY BAD idea when you have, for instance, more than 100."

	|answer|

	answer := TreeSet sortSelector: aSelector equalitySelector: #isIdenticalTo:.
	self aggregateClasses do:[:anAggregateClass|
		anAggregateClass == ARAggregate ifFalse:[
			answer addAll: anAggregateClass localFindAll]].

	^ answer