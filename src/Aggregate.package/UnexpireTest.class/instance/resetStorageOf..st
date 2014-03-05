actions
resetStorageOf: aPool

	super resetStorageOf: aPool.
	
	aPool commit:[
		ARPersonMock indices do:[:anIndex| (aPool root at: #storage) addIndex: anIndex].
		]