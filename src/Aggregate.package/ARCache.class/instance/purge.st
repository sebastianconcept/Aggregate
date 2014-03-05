actions
purge 
	"Purifies the support of this cache"
	
	self protection critical:[
		self support values do:[:aQueryResult|
			aQueryResult purge]].
	
	self initializeSupport 
	