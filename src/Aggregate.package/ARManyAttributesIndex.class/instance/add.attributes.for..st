actions
add: anAggregate attributes: someAttributes for: aStorage
	"Adds anAggregate relating it with someAttributes"

	anAggregate isNil ifTrue:[
		^ ARCantStoreNil signal].
	
	ARCurrentContainer use: (aStorage containerNameForAttributeIndex: self) during:[ |indexable set|

		indexable := anAggregate perform: selector.

		(allowsNil not and:[
		indexable isNil]) ifTrue:[
			^ ARCantIndexNil signal].

		((indexable notNil and:[indexable isMany not]) or:[
		(indexable isNil and:[allowsNil not])]) ifTrue:[
			"This index mantains (so expects) an attribute that answers many objects.
			Also nil (if allowed)"
			^ ARCantStoreMany signal].

		someAttributes at: selector put: indexable; markDirty.

		indexable isNil
			ifTrue: [
				set := self setForValue: self nilKey.
				set add: anAggregate; markDirty]
			ifFalse:[|indexableValue|
				indexable do:[:element|
					element = self nilKey ifTrue:[
					"A non nil element that is equal to the value used to index by the nil value.
					This is extreamely unlikely to happen but needs control"
					^ ARIndexCollisionWithNil signal].
				set := self setForValue: element.
				set add: anAggregate; markDirty]].
		
		"Currently we don't have an efficient way to control uniqueness of combinations
		(isUnique and:[set size > 1]) ifTrue:[
			ARKeyAlreadyStored signal]"]