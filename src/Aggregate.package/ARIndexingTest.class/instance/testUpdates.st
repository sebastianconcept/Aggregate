testing
testUpdates

	| someUsers oldUsernames newUsernames someNames |

	self resetStorage.
	self addDummyUsers: 10 times: 1.
	someUsers := users copy.

	oldUsernames := pool readOnly: [ARDummyUser findAll collect:[:e| e username]].
 	newUsernames := ((1 to: 10) collect:[:i| UUID new asString36]) asSet.
	someNames := newUsernames copy. "convenience to make a destructive interation"
	
	pool commit:[
		someUsers do:[:guy| |answeredGuy newName oldName|
			answeredGuy := ARDummyUser atId: guy id.
			self assert: answeredGuy notNil.
			self assert: answeredGuy id = guy id.
			self assert: answeredGuy username = guy username.
			self deny: (guy isIdenticalTo: answeredGuy).
			newName := someNames remove: someNames anyOne.
			oldName := answeredGuy username.
			answeredGuy username: newName; save.
			
			self assert: (ARDummyUser atUsername: oldName) isNil.
			self assert: (ARDummyUser atId: answeredGuy id) username = newName]].

	pool readOnly:[
		oldUsernames do:[:anOldName|
			self assert: (ARDummyUser atUsername: anOldName) isNil].
		newUsernames do:[:aNewName|
			self assert: (ARDummyUser atUsername: aNewName) notNil]].
