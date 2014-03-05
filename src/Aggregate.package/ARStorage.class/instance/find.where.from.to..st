queries
find: anAggregateClass where: aSelectorSymbol from: start to: end
	"Answers the instance of anAggregateClass who's
	aSelectorSymbol answers aValue that is included in the given interval. 
	Or.. nil if not found."
	
	| index result |
	index := self indexFor: anAggregateClass selector: aSelectorSymbol.
	index hasSortSelector
		ifTrue: [result := TreeSet sortSelector: index sortSelector equalitySelector: #=]
		ifFalse: [result := TreeSet sortSelector: aSelectorSymbol equalitySelector: #isIdenticalTo:].
	
	index
		from: start 
		to: end 
		do: [:anAggregate| result add: anAggregate]
		for: self.
		
	^ result