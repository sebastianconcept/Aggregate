testing
testSize

	| someId someUsers |

	self resetStorage.

	pool readOnly:[
		self deny: ARDummyUser hasAny.
		self assert: ARDummyUser size isZero].

	self addDummyUsers: 10 times: 1.
	someUsers := users copy.
	pool readOnly:[
		self assert: ARDummyUser size = 10.
		self assert: (ARDummyUser sizeOfIndex: #id) = 10.
		self assert: (ARDummyUser sizeOfIndex: #username) = 10].

	pool commit:[
		someId := (someUsers remove: someUsers anyOne) id.
		(ARDummyUser atId: someId) destroy].
	pool readOnly:[
		self assert: ARDummyUser size = 9.
		self assert: (ARDummyUser sizeOfIndex: #id) = 9.
		self assert: (ARDummyUser sizeOfIndex: #username) = 9].
	
	pool commit:[
		1 to: 9 do:[:i|
			someId := (someUsers remove: someUsers anyOne) id.
			(ARDummyUser atId: someId) destroy.
			self assert: ARDummyUser size = (9 -i).
			self assert: (ARDummyUser sizeOfIndex: #id) = (9 -i).
			self assert: (ARDummyUser sizeOfIndex: #username) = (9 -i)]].

	pool readOnly:[
		self deny: ARDummyUser hasAny.
		self assert: ARDummyUser size isZero.
		self assert: (ARDummyUser sizeOfIndex: #id) isZero.
		self assert: (ARDummyUser sizeOfIndex: #username) isZero].
	
	
