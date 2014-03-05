accessing
indexedAttributesFor: anAggregate
	"Answers the dictionary with the values related to anAggregate.
	Note: the dictionary stores associations of attribute -> value
	where attribute is the selector of the aggregate for a given value"
	
	| containerName |

	containerName := containerPolicy indexedAttributesContainerNameFor: anAggregate in: self.
	
	^ ARCurrentContainer use: containerName during:[| indexedAttributesIndex |
		indexedAttributesIndex := self indexOfIdexedAttributesFor: anAggregate.
		indexedAttributesIndex 
			at: anAggregate id
			ifAbsent: [
				indexedAttributesIndex
					at: anAggregate id
					put: (self currentTransaction
							makePersistent: Dictionary new
							in: containerName)]]	
	