testing
isAbstract
	"Answers true if the aggregate is abstract.
	Very useful to subclassify a family of aggregates but
	that it wouldn't make sense to create instances.

	You can (sub) implement where nessesary in an abstract aggregate like this:
	
	^ self == AnAbstractAggregateClass"
	
	^ false