test
testExpiration

	| guy friend |

	guy := ARPersonMock testPerson.
	friend := ARPersonMock testPerson.

	pool commit:[
		friend save.
		guy buddy: friend.
		guy save].	
	
	pool commit:[
		guy := ARPersonMock atId: guy id. 
		self assert: guy id isODBExpired not.
		self assert: guy id isODBReference.
		guy currentTransaction makePersistent: guy name. 
		guy currentTransaction markDirty: guy name].

	pool commit:[
		guy := ARPersonMock atId: guy id]. 

	self assert: (guy id odbResolve class = ODBExpiredProxyObject).
