enumerating
keysDo: aBlock
	keys withIndexDo:
		[:key :i |
		key ifNotNil: [aBlock value: key] ifNil: [^ self]]