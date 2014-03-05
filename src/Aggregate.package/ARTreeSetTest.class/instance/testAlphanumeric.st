testing
testAlphanumeric
	
	| sorted tree elements |
	
	sorted := SortedCollection sortBlock: [:a :b| a < b].	
	elements := self someAlphanumerics.
	
	pool commit:[
		tree := ARTreeSet sortBy: #yourself.
		pool root at: #stuff put: tree.
		sorted addAll: elements.
		tree addAll: elements].

	1 to: elements size do:[:i|
		self assert: (sorted at: i) = (tree atIndex: i)].
	
	pool readOnly:[
		1 to: elements size do:[:i| |stuff|
			stuff := pool root at: #stuff.
			self assert: (sorted at: i) = (stuff atIndex: i)]]
		
