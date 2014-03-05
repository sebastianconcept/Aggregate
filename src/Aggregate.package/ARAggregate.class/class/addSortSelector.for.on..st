actions
addSortSelector: aSymbol for: anIndexedSelector on: someIndices
	"Sets aSymbol in the index found at someIndices that is 
	working to keep fast access to anIndexedSelector 
	of this kind of aggregate."

	(someIndices detect: [:e| e indexesClass: self selector: anIndexedSelector]) sortSelector: aSymbol 