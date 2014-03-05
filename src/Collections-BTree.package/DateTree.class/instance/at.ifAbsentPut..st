accessing
at: aTimespan ifAbsentPut: exceptionBlock
	^ self at: aTimespan ifAbsent: [ self at: aTimespan put: exceptionBlock value ].