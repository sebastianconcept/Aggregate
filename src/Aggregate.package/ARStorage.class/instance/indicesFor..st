accessing
indicesFor: anAggregateClass
	"Answers the indices that are maintainers 
	of anAggregateClass kind of aggregates"
	
	^ self indices at: anAggregateClass name 