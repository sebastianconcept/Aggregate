testing
testInsert

	| someUserIds |

	self resetStorage.
	self addDummyUsers: 10 times: 1.
	someUserIds := users collect:[:u| u id].

	pool readOnly:[
		ARDummyUser findAll do:[:guy|
			self assert: (someUserIds includes: guy id).
			self assert: (users anySatisfy: [:u| u id = guy id])]].
	
	pool readOnly:[
		self assert: ARDummyUser size = 10.
		self assert: (ARDummyUser sizeOfIndex: #id) = 10.
		self assert: (ARDummyUser sizeOfIndex: #username) = 10].
