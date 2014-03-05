actions
remove: anAggregate attributes: someAttributes for: aStorage
	"Removes anAggregate un-relating it to someAttributes for aStorage."

	| value set oldAttribute setKey |
	ARCurrentContainer use: (aStorage containerNameForAttributeIndex: self) during:[
		oldAttribute := someAttributes at: selector ifAbsent:[nil].

		"even if it doesn't allow nil, why complaining on a remove, right? 
		(oldAttribute isNil and:[
		allowsNil not]) ifTrue:[
			^ ARCantIndexNil signal]."

		(allowsNil and:[
		oldAttribute isNil])
			ifTrue: [setKey := self nilKey]
			ifFalse: [setKey := oldAttribute].
		set := self setOrNilForValue: setKey.
		set isNil ifFalse:[
			set remove: anAggregate; markDirty.
			set isEmpty ifTrue:[
				(oldAttribute isNil and:[
				allowsNil]) 
					ifTrue:[setKey := self nilKey]
					ifFalse:[setKey := oldAttribute].
				self indexingSupport
					removeKey: setKey;
					markDirty]]]