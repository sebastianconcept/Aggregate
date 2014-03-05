as yet unclassified
valueForKey: aMagnitude ifPresent: aBlock
	^ aBlock value: (self valueForKey: aMagnitude ifAbsent: [^ nil])