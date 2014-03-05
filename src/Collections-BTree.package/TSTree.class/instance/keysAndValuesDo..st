enumerating
keysAndValuesDo: aBlock
	emptyValue ifNotNil:
		[aBlock value: '' value: emptyValue].
	root ifNotNil: [root keysAndValuesDo: aBlock prefix: '']