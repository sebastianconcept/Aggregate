testing
matches: someAttributes for: anAggregate
	"Answers true if, regarding to this index, 
	anAggregate matches someAttributes of false otherwise."
	
	^ (anAggregate perform: selector) = (someAttributes at: selector ifAbsent:[])