adding
at: aMagnitude ifAbsentPut: aBlock
	^ self at: aMagnitude ifAbsent: [self at: aMagnitude put: aBlock value]