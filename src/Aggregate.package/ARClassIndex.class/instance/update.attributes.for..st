actions
update: anAggregate attributes: someAttributes for: aStorage
	"Update (if needs to) the necessary indices for anAggregate"

	ARCurrentContainer use: (aStorage containerNameForAttributeIndex: self) during:[
		self remove: anAggregate attributes: someAttributes for: aStorage.
		self add: anAggregate attributes:  someAttributes for: aStorage]