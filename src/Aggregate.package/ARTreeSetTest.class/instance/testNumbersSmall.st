testing
testNumbersSmall
	
	| sorted tree elements |
	
	sorted := SortedCollection sortBlock: [:a :b| a < b].
	
	elements := #(
		0.000648575369570672
		0.000731434207750221
		0.001271925867196138
		0.001606590580943316
		0.003727566452570058
		0.00424666097585422
		).

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
	
		
