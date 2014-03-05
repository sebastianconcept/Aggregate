enumerating
do: aBlock
	emptyValue ifNotNilDo: aBlock.
	root ifNotNil: [root do: aBlock]