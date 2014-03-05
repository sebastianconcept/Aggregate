queries
atId: anId
	"Answers the aggregate found at anId or nil."

	|answer|

	self aggregateClasses do:[:anAggregateClass| |found|
		anAggregateClass == ARAggregate ifFalse:[
			found := anAggregateClass basicAtId: anId.
			found notNil ifTrue: [
				answer := found]]].
	^ answer