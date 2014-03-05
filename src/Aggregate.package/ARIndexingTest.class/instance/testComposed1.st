testing
testComposed1

	| user person good bad |

	self resetStorage.

	user := ARDummyUser new.
	person := ARDummyPerson new.
	user person: person.

	pool commit:[|personObjectID userObjectID|
		person save.
		personObjectID := pool currentTransaction getObjectIDOrNil: person.		
		user save.
		userObjectID := pool currentTransaction getObjectIDOrNil: user.
		self assert: (person isIdenticalTo: user person)].
	
	pool readOnly:[|guy|
		guy := person fresh.
		self assert: (guy isIdenticalTo: person fresh).
		self assert: (guy isIdenticalTo: user fresh person).
		self assert: (guy isIdenticalTo: user person fresh).
		self assert: (person isIdenticalTo: person aggregate).
		self assert: (guy isIdenticalTo: person fresh aggregate).

		"Pay attention to these ones..."
		self assert: (guy fresh = guy).
		self assert: (guy = guy fresh).
		self assert: (guy fresh isIdenticalTo: guy).
		self assert: (guy isIdenticalTo: guy).
		self assert: (guy isIdenticalTo: guy fresh).

		self assert: (guy fresh = guy fresh).
		self assert: (guy fresh isIdenticalTo: guy fresh)]