testing
testComposed2

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

	good := ARDummyTag new label: 'good'.
	bad := ARDummyTag new label: 'bad'.
	person tags add: good.

	pool commit:[
		person := person fresh.
		good save.
		bad save.
		person tags add: good.
		person save].	

	pool readOnly:[
		self assert: (person fresh tags anyOne isIdenticalTo: good fresh)].

	pool commit:[|g|
		g := good fresh.
		g label: 'terrific'; save.
		self assert: (person fresh tags anyOne label = 'terrific')].
	
	pool readOnly:[
		self assert: (person tags anyOne fresh label = 'terrific').
		self assert: (person fresh tags anyOne label = 'terrific').
		self assert: (person tags anyOne fresh isIdenticalTo: person fresh tags anyOne)].

	pool commit:[|g|
		good := good fresh.
		good save.
		self assert: (person fresh tags anyOne label = 'terrific')].

	pool readOnly:[
		self assert: (person tags anyOne fresh label = 'terrific')].
	
	pool readOnly:[|guy|
		guy := person fresh.
		self assert: (guy fresh isIdenticalTo: guy).
		self assert: (guy fresh isIdenticalTo: guy fresh)]