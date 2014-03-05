testing
testRemove

	| someUserIds someUsernames creations |

	self resetStorage.
	self addDummyUsers: 10 times: 1.
	someUserIds := users collect:[:u| u id].
	someUsernames := users collect:[:u| u username].
	creations := users collect:[:u| u createdOn].

	pool readOnly:[
		ARDummyUser findAll do:[:guy|
			self assert: (someUserIds includes: guy id).
			self assert: (users anySatisfy: [:u| u id = guy id])]].
	
	pool readOnly:[
		self assert: ARDummyUser size = 10.
		self assert: (ARDummyUser sizeOfIndex: #id) = 10.
		self assert: (ARDummyUser sizeOfIndex: #username) = 10].

	pool commit:[ARDummyUser findAll do:[:u| u destroy]].

	pool readOnly:[self assert: ARDummyUser findAll isEmpty].
	
	pool readOnly:[
		self deny: ARDummyUser hasAny.
		self assert: ARDummyUser size isZero.
		self assert: (ARDummyUser sizeOfIndex: #id) isZero.
		self assert: (ARDummyUser sizeOfIndex: #username) isZero.

		someUsernames do:[:username|
			self assert: (ARDummyUser atUsername: username) isNil].
		
		creations do:[:dateTime|
			self assert: (ARDummyUser withDateTime: dateTime) isEmpty].
		].
