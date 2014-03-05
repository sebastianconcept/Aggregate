actions
add: anAggregate
	"Adds anAggregate to the repository
	Note: there are validations and policies to meet 
	the application's model required data consistence"
	| containerName attributes |
	
	containerName := containerPolicy containerNameFor: anAggregate in: self.

	ARCurrentContainer use: containerName during:[|aggregateIndices|
		self makeAggregatePersistent: anAggregate in: containerName.

		attributes := self indexedAttributesFor: anAggregate.
		aggregateIndices := self indicesFor: anAggregate class.
		aggregateIndices ifNil:[^ ARNoIndicesForAggregate signal].
		aggregateIndices do: [:index | 
			index add: anAggregate attributes: attributes for: self]]