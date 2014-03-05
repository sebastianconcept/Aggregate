private
setForValue: anAggregateOrValue
	"Answers the (potentially big) set of objects related to
	anObject regarding to this index."

	^ self indexingSupport 
		at: anAggregateOrValue 
		ifAbsent:[|set|
			set := self makeSetFor: anAggregateOrValue.
			self indexingSupport 
				at: anAggregateOrValue put: set; 
				markDirty;
				yourself.
			set]