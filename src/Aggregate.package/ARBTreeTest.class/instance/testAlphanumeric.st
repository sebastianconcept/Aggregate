testing
testAlphanumeric
	
	| sorted tree elements |
	
	sorted := SortedCollection sortBlock: [:a :b| a < b].
	tree := BTree order: 8.
		
	elements := self someAlphanumerics.

	sorted addAll: elements.
	sorted do:[:e|
		tree at: (sorted indexOf: e) put: e].

	1 to: elements size do:[:i|
		self assert: (sorted at: i) = (tree at: i)].
	
	tree 
		from: 1 
		to: elements size 
		keysAndValuesDo: [:k :v|
			self assert: (sorted at: k) = v]
		

		
