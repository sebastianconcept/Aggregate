actions
remove: anAggregate attributes: someAttributes for: aStorage
	"Removes anAggregate un-relating it to someAttributes for aStorage."

	| toRemove key |

	ARCurrentContainer use: (aStorage containerNameForAttributeIndex: self) during:[
		toRemove := someAttributes at: selector ifAbsent:[nil].

		"even if it doesn't allow nil, why complaining on a remove, right? 
		(toRemove isNil and:[
		allowsNil not]) ifTrue:[
			^ ARCantIndexNil signal]."

		(allowsNil and:[
		toRemove isNil])
			ifTrue: [key := self nilKey]
			ifFalse: [key := toRemove].

		self indexingSupport 
			removeKey: key;
			markDirty;
			yourself]