accessing
aggregateSize 

	^ aggregateSize ifNil:[self initializeAggregateSize]