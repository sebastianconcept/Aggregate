private
indexedAttributesKeyFor: anAggregate
	"Answers the key under which the indexed 
	attributes are to be found."
	
	^ anAggregate class name, '-indexedAttributes'