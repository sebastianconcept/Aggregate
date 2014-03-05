actions
remove: anAggregate attributes: someAttributes for: aStorage
	"Removes anAggregate un-relating it to someAttributes for aStorage."

	| value set oldMany setKey |

	ARCurrentContainer use: (aStorage containerNameForAttributeIndex: self) during:[
		oldMany := someAttributes at: selector  ifAbsent:[nil].

		(oldMany isNil and:[
		allowsNil not]) ifTrue:[
			^ ARCantIndexNil signal].

		oldMany isNil 
			ifTrue: [
				set := self setOrNilForValue: self nilKey.
				set isNil ifFalse:[
					self indexingSupport 
						removeKey: self nilKey;
						markDirty]]
			ifFalse: [
				oldMany do:[:element|
					element isNil ifTrue:[
						"It has no sense to allow mix nil in the attribute itself toghether with 
						some element in nil in the middle of many."
						^ ARCantIndexNil signal].
					set := self setOrNilForValue: element.
					set isNil ifFalse:[
						set remove: anAggregate; markDirty.
						set isEmpty ifTrue:[
						self indexingSupport
							removeKey: element;
							markDirty]]]]]