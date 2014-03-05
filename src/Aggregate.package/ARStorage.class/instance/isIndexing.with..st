testing
isIndexing: aClass with: aSelector
	"Answers true if the receiver is indexing aClass 
	with an accessor invoked by aSelector"

	^ self indices values anySatisfy: [:indices| 
		indices anySatisfy:[:index|
			(index indexesClass: aClass) and:[
			index selector = aSelector]]]