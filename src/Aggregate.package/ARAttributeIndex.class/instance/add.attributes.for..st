actions
add: anAggregate attributes: someAttributes for: aStorage
	"Adds anAggregate relating it with someAttributes"

	| value set |

	anAggregate isNil ifTrue:[
		^ ARCantStoreNil signal].
	
	ARCurrentContainer use: (aStorage containerNameForAttributeIndex: self) during:[		
		value := anAggregate perform: selector.

		(allowsNil not and:[
		value isNil]) ifTrue:[
			^ ARCantIndexNil signal].

		someAttributes at: selector put: value; markDirty.

		value isNil
			ifTrue: [set := self setForValue: self nilKey]
			ifFalse:[
				self nilKey = value ifTrue:[
					"A non nil value that is equal to the value used to index by the nil value.
					This is extreamely unlikely to happen but needs control.
					Note: the order, nil (first) = value (second) is because value could have
					a 'creative' implementation of = and nilKey won't (it's the string's =)"
					^ ARIndexCollisionWithNil signal].
				set := self setForValue: value].

		set add: anAggregate; markDirty]