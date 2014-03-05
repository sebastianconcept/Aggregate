enumerating
keysAndValuesDo: aBlock
	keys withIndexDo:
		[:key :i |
		key ifNotNil: [aBlock value: key value: (self at: i)]]