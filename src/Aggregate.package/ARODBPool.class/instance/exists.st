testing
exists
	"Answers true if this pool detects an existing repository"
	
	^ self hasClients or:[
	"The existence test is not currently superb, it's just a directory check"
	path asFileReference exists and:[
	self hasOmniBaseFiles and:[
	self hasRoot]]]