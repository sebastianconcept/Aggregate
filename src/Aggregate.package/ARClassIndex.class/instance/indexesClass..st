testing
indexesClass: aClass
	"Answers true if this index actualli do index objects of aClass.
	Note: Aggregates indices need to be strict. 
	For indices there is no heritage."

	^ (Smalltalk includesKey: className) and:[
	aClass = self aggregateClass]
