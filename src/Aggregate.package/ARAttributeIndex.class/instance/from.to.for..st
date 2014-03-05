queries
from: start to: end for: aStorage
	"Answers the aggregates found in this index 
	related to the given interval (as occurrences)."
	
	"This design wasn't considering to handle occurrences so his implementation
	isn't efficient. It will do its work for small ranges though, specially if it starts 
	near the beggining of the index."
	^ ARCurrentContainer use: (aStorage containerNameForAttributeIndex: self) during:[
		start <= end 
			ifTrue:[(ARIndexIterator on: self) from: start to: end]
			ifFalse:[(ARReverseIndexIterator on: self) from: start to: end]]