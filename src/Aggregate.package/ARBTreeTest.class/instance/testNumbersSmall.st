testing
testNumbersSmall
	
	| sorted tree elements |
	
	
	
	sorted := SortedCollection sortBlock: [:a :b| a < b].
	tree := BTree order: 8.
		
	elements := #(
		0.000648575369570672
		0.000731434207750221
		0.001271925867196138
		0.001606590580943316
		0.003727566452570058
		0.00424666097585422
		).

	sorted addAll: elements.
	sorted do:[:e|
		tree at: (sorted indexOf: e) put: e].

	1 to: elements size do:[:i|
		self assert: (sorted at: i) = (tree at: i)]
		
