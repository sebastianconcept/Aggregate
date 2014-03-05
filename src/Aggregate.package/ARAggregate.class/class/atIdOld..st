queries
atIdOld: anId
	"Answers the aggregate found at anId or nil.
	Note: it allows you to search in an abstraction of the aggregate."

	|answer|

	self aggregateClasses do:[:anAggregateClass| |found|
		anAggregateClass == ARAggregate ifFalse:[
			found := anAggregateClass basicAtId: anId.
			found notNil ifTrue: [
				answer := found]]].
	^ answer