private
indices
	"Answers the indices for this active record 
	so it performs well for the application using it.
	Note: repository rebuild is recomended"

	^ super indices
		add: (ARAttributeIndex new 
				aggregateClass: self; 
				selector: #createdOn;
				keySize: self dateKeySize;
				yourself);
		add: (ARUniqueAttributeIndex new 
				dontAllowNil;
				aggregateClass: self; 
				selector: #username;
				keySize: self usernameKeySize;
				yourself);
		add: (ARManyAttributesIndex new 
				allowNil;
				aggregateClass: self; 
				selector: #tags;
				keySize: self idKeySize;				
				yourself);
		yourself