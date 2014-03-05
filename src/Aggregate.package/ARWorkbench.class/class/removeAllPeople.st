actions
removeAllPeople
	
	self odb commit:[
		ARPersonMock findAll do:[:e| e destroy]].
