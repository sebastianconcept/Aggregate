initializing
setUp
	
	pool := ARODBPool onPath: self repositoryPath.
	
	pool exists ifTrue:[
		pool destroy]