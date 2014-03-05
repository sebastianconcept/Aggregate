actions
remove: anAggregate
	"Remove anAggregate from the repository
	Note: there are validations and policies to meet 
	the application's model required data consistence"
	| containerName attributes |
	
	containerName := containerPolicy containerNameFor: anAggregate in: self.

	ARCurrentContainer use: containerName during:[
		attributes := self indexedAttributesFor: anAggregate.
		(self indicesFor: anAggregate class) do: [:index | 
			index remove: anAggregate attributes: attributes for: self].

		(self indexedAttributesFor: anAggregate) 
			removeKey: anAggregate 
			ifAbsent: []]