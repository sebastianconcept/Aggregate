testing
testLocate

	self resetStorage.
	self addDummyUsers: 5 times: 1.

	pool readOnly:[
		ARDummyUser findAll do:[:guy|
			self assert: (ARDummyUser atId: guy id) = guy]].
	

	pool readOnly:[|some|
		some := ARDummyUser find: users anyOne createdOn of: #createdOn.
		"This may fail if the host is too slow (unable to store 5 in less than a sec)"
		self assert: some size = 5.].
