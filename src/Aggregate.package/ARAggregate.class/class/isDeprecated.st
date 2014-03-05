testing
isDeprecated
	"Answers true if the aggregate is deprecated.
	Very useful for migrations after design changes.

	You can (sub) implement something like this in a deprecated class:
	
	^ self == ADeprecatedAggregateClass"
		
	^ false