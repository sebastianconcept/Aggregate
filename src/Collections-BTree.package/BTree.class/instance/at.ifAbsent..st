accessing
at: aMagnitude ifAbsent: errorBlock
       | leaf |
       leaf := root existingLeafForKey: aMagnitude.
       leaf ifNil: [^ errorBlock value].
       ^ leaf valueForKey: aMagnitude ifAbsent: errorBlock