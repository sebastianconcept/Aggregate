private
setOrNilForValue: anAggregateOrValue
	"Answers the (potentially big) set of objects related to
	anAggregateOrValue regarding to this index or nil if there isn't one."

	^ self indexingSupport 
		at: anAggregateOrValue 
		ifAbsent:[nil]