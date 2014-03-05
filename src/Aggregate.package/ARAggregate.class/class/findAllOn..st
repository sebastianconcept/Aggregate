private
findAllOn: anIndexedSelector

	^ (self storage isIndexing: self with: anIndexedSelector)
		ifTrue: [(self storage indexFor: self selector: anIndexedSelector) values]
		ifFalse: [self error: self name, ' is not being indexed with ', anIndexedSelector]
	 
	