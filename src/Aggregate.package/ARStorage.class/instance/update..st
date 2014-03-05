actions
update: anAggregate
	"Updates the indices for anAggregate in the repository
	Note: there are validations and policies to meet 
	the application's model required data consistence"
	| containerName attributes |

	containerName := containerPolicy containerNameFor: anAggregate in: self.

	ARCurrentContainer use: containerName during:[
		self makeAggregatePersistent: anAggregate in: containerName.
		attributes := self indexedAttributesFor: anAggregate.
		(self indicesFor: anAggregate class) do: [:index | 
			index update: anAggregate attributes: attributes for: self]]