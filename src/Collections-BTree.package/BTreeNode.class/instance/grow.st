private
grow
	| sibling |
	parent ifNotNil:
		[sibling := parent nextSiblingForChild: self.
		sibling ifNil: [self parent: nil. ^ self].
		sibling canShrink
			ifTrue: [self stealFrom: sibling]
			ifFalse: [self mergeWith: sibling]]
				