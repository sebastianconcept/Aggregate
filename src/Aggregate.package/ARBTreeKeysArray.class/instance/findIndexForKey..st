as yet unclassified
findIndexForKey: aMagnitude
	self withIndexDo:
		[:key :i |
		(key isNil or: [key > aMagnitude]) ifTrue:
			[^ i - 1]].
	^ self size
