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
			^ ARCantIndexNil signalFor: anAggregate].

		someAttributes at: selector put: value; markDirty.
	
		value isNil
			ifTrue: ["self error: 'this should never happen'"
				self indexingSupport 
					at: self nilKey
					put: anAggregate;
					markDirty;
					yourself]
			ifFalse:[|found|
				found := self indexingSupport at: value.
				(found notNil and:[
				(found isIdenticalTo: anAggregate) not]) ifTrue:[
					ARKeyAlreadyStored signalFor: anAggregate].
				value = self nilKey ifTrue:[
					"This exceptionis is just bad luck... if it happens it means 
					you tried to use a value that is reserved for this index.
					A non nil value that is equal to the value used to index by the nil value.
					This is extreamely unlikely to happen but needs control"
					^ ARIndexCollisionWithNil signalFor: anAggregate].
				self indexingSupport 
					at: value 
					put: anAggregate;
					markDirty;
					yourself]]