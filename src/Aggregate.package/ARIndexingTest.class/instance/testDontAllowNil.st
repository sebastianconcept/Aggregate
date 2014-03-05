testing
testDontAllowNil

	| oldId newId |

	self resetStorage.
	self addDummyUsers: 10 times: 1.
	oldId := users anyOne id.


	self 
		should:[pool commit:[(ARDummyUser atId: oldId) username: nil; save]] 
		raise: ARCantIndexNil.
	
