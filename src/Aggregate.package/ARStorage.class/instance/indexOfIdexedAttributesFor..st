private
indexOfIdexedAttributesFor: anAggregate
	"Answers the (potentially big) dictionary 
	of indexed attributes for anAggregate kind of aggregates.
	Note: this indirection is to have one per aggregate.
	It'll be lazily added when necessary"

	^ OmniBase root 
		at: (self indexedAttributesKeyFor: anAggregate) 
		ifAbsentPut: [OmniBase newBTreeIdentityDictionary makePersistent]
		"ifAbsentPut: [ARBTree order: 32]"
