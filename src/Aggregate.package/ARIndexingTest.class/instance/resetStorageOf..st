actions
resetStorageOf: aPool

	aPool commit:[
		aPool root ifNil:[
			aPool currentTransaction root: ODBPersistentDictionary new].
		aPool root at: #storage put: ARStorage new.
		ARDummyUser indices do:[:anIndex| (aPool root at: #storage) addIndex: anIndex].
		ARDummyPerson indices do:[:anIndex| (aPool root at: #storage) addIndex: anIndex].
		ARDummyTag indices do:[:anIndex| (aPool root at: #storage) addIndex: anIndex]]