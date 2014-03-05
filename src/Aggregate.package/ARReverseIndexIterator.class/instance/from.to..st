queries
from: startPosition to: endPosition
	"Answers the aggregates found in the index 
	in the given interval (as ocurrences)"

	^ (ARIndexIterator on: index) 
		from: endPosition  
		to: startPosition 