enumerating
allChildrenDo: aBlock
	self childrenDo:
		[:ea |
		aBlock value: ea.
		ea allChildrenDo: aBlock]