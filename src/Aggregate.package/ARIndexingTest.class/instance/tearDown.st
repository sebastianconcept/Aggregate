initializing
tearDown
	
	users := nil.
	
	pool isNil ifFalse:[|p|
		p := pool.
		pool := nil.
		p reset].
