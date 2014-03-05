testing
testStoreNil

	| oldId newId |

	self resetStorage.
	self addDummyUsers: 10 times: 1.
	oldId := users anyOne id.

	self 
		should:[pool commit:[((pool root at: #storage) 
									indexFor: ARDummyUser  
									selector: #id)
										add: nil
										attributes: Dictionary new
										for: (pool root at: #storage)]] 
		raise: ARCantStoreNil.

	
