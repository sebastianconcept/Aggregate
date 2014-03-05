testing
inSegment: someSets isIncluded: startPosition
	"Answers true if startPosition is reachable in the 
	segment represented by the sum of the sizes of someSets.
	Note: it caches in the value of the size of the sets in the 
	association so the expensive operation is made only once."
	
	^ startPosition <= (someSets inject: 0 into:[:sum :pair|
		pair value isNil ifTrue:[
			pair value: pair key size].
		sum + pair value])