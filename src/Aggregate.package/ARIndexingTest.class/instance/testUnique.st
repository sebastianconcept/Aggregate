testing
testUnique

	| someUsers |

	self resetStorage.
	self addDummyUsers: 10 times: 1.
	someUsers := users copy asOrderedCollection.

	self should:[  
		pool commit:[|guy|
			guy := someUsers first fresh.
			guy username: someUsers last username.
			guy save]]
		raise: ARKeyAlreadyStored.

