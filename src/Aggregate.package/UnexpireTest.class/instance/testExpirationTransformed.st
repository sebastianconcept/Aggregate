test
testExpirationTransformed

	| guy name |

	guy := ARPersonMock testPerson.
	name := guy name.
	pool commit:[guy save].	
	
	pool commit:[
		guy := ARPersonMock atId: guy id. 
		guy save.
		self assert: guy id isODBExpired not.
		self assert: guy id isODBReference.
		guy currentTransaction makePersistent: guy name. 
		guy currentTransaction markDirty: guy name].

	pool commit:[
		guy := ARPersonMock atId: guy id]. 
	
	pool readOnly:[
		self shouldnt:[guy name odbResolve first: 3] raise: Error.
		self shouldnt:[self assert: guy name asString = name] raise: Error].

