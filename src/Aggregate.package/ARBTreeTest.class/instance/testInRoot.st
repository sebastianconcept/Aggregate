testing
testInRoot
	
	pool commit:[
		self should: [pool root at: #place] raise: KeyNotFound].
	
	pool commit:[
		pool root at: #place put: (ARTreeSet sortSelector: #name equalitySelector: #=).
		self shouldnt: [pool root at: #place] raise: KeyNotFound].

	pool commit:[
		self shouldnt: [pool root at: #place] raise: KeyNotFound.
		self assert: (pool root at: #place) odbObjectID notNil.
		self assert: (pool root at: #place) odbGetOID notNil].

	pool commit:[
		pool root removeKey: #place.
		self should: [pool root at: #place] raise: KeyNotFound].
