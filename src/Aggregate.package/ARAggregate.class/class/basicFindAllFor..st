private
basicFindAllFor: someAggregateClasses
	"Answers all stored instances of this kind aggregate
	including the ones of the kinds at someAggregateClasses."

	| answer index |
	
	index := someAggregateClasses
				detect:[:anAggregateClass| self storage hasIndicesFor: anAggregateClass]
				ifNone:[nil].
	index isNil
		ifTrue:[answer := TreeSet sortBy: #id]
		ifFalse:[
			index := self storage indexFor: index selector: #id.
			index hasSortSelector 
				ifTrue:[answer := TreeSet sortBy: index sortSelector]
				ifFalse:[answer := TreeSet sortBy: #id]].

	someAggregateClasses do:[:anAggregateClass|
		anAggregateClass == ARAggregate ifFalse:[
			answer addAll: anAggregateClass localFindAll]].	 
	
	^ answer 