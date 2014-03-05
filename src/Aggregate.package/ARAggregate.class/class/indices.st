private
indices
	"Answers the indices for this active record 
	so it performs well for the application using it.
	Note: repository rebuild is recomended"

	"The id is a required index to locate instances by id"
	^ OrderedCollection new
		add: (ARUniqueAttributeIndex new
				dontAllowNil;
				keySize: self idKeySize;
				aggregateClass: self; 
				selector: #id;
				yourself);
		yourself