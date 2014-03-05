as yet unclassified
commonKeysWith: aNode keysAndValuesDo: aBlock flip: aBoolean
	| index key block leaf advanceKey last |

	aNode firstKey ifNil: [^ self].

	block := aBoolean ifTrue: [[:k :v1 :v2 | aBlock value: k value: v2 value: v1]] ifFalse: [aBlock].

	index := 0.
	advanceKey :=
		[index := index + 1.
		index > self size ifTrue: [^ self].
		key := keys at: index.
		key ifNil: [^ self]].
	last := self lastKey.
	
	advanceKey value.
	[key < aNode firstKey] whileTrue: advanceKey.
		
	[leaf := aNode existingLeafForKey: key.
	leaf lastKey < key ifTrue: advanceKey ifFalse:
		[leaf keysAndValuesDo:
			[:otherKey :otherValue |
			otherKey > last ifTrue: [^ self].
			[key < otherKey] whileTrue: advanceKey.
			key = otherKey ifTrue: [block value: key value: (self at: index) value: otherValue]].
		key > leaf lastKey ifFalse: advanceKey]] repeat
