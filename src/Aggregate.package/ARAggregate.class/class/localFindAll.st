private
localFindAll
	"Answers all stored instances or an empty set
	for this aggregate alone without including 
	the ones of its subclasses."

	^ (self storage isIndexing: self with: #id)
		ifTrue: [self primaryIndex indexingSupport values]
		ifFalse: [#()]
	 
	