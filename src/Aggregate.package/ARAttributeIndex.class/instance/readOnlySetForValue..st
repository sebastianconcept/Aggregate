private
readOnlySetForValue: anAggregateOrValue
	"Answers the (potentially big) set of objects related to
	anAggregateOrValue regarding to this index or nil.
	Note: it won't create the set if it does not exists.'"

	^ self setOrNilForValue: anAggregateOrValue