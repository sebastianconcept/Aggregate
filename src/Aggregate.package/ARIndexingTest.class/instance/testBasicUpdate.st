testing
testBasicUpdate

	| someId oldUsername newUsername |

	self resetStorage.
	self addDummyUsers: 10 times: 1.
	someId := users anyOne id.

	oldUsername := 'smeagol'.
	pool commit:[|guy|
		guy := (pool root at: #storage) find: ARDummyUser where: #id is: someId.
		self assert: guy notNil.
		self assert: (guy isIdenticalTo: (ARDummyUser atId: someId)).
		(ARDummyUser atId: someId) username: oldUsername; save].
	newUsername := 'gollum'.
	pool commit:[|user|
		user := ARDummyUser atUsername: oldUsername.
		self assert: user id = someId.
		user username: newUsername; save].
	
	pool readOnly:[
		self assert: (ARDummyUser atId: someId) username = newUsername.
		self assert: (ARDummyUser atId: someId) = (ARDummyUser atUsername: newUsername).
		self assert: (ARDummyUser atUsername: oldUsername) isNil].

