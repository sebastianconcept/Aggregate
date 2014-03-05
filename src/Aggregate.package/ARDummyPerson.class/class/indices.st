private
indices
	"Answers the indices for this active record 
	so it performs well for the application using it.
	Note: repository rebuild is recomended"

	^ super indices
		add: (ARAttributeIndex new 
				aggregateClass: self; 
				selector: #firstName;
				keySize: self nameKeySize;
				yourself);
		yourself