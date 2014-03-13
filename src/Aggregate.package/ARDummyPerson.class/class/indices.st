private
indices
	"Answers the indices for this aggregate
    so it performs well for the application using it.
    Note: a repository index rebuild is needed when this definition changes"

	^ super indices
		add: (ARAttributeIndex new 
				aggregateClass: self; 
				selector: #firstName;
				keySize: self nameKeySize;
				yourself);
		yourself