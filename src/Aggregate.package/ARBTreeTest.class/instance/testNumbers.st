testing
testNumbers
	
	| sorted tree elements |
	

	
	sorted := SortedCollection sortBlock: [:a :b| a < b].
	tree := BTree order: 8.
		
	elements := self someNumbers.

	sorted addAll: elements.
	sorted do:[:e|
		tree at: (sorted indexOf: e) put: e].

	1 to: elements size do:[:i|
		self assert: (sorted at: i) = (tree at: i)]
		
