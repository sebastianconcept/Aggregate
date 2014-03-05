as yet unclassified
commonKeysWith: aNode keysAndValuesDo: aBlock flip: aBoolean
	| index |
	aNode firstKey < self firstKey ifTrue: [^ aNode commonKeysWith: self keysAndValuesDo: aBlock flip: aBoolean not].
	index := (keys findIndexForKey: aNode firstKey) max: 1.
	index to: self size do:
		[:i |
		(self at: i) ifNotNilDo: [:c | c commonKeysWith: aNode keysAndValuesDo: aBlock flip: aBoolean]]