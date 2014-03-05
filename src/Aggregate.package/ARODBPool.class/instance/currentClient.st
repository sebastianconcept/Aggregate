accessing
currentClient
	"Answers the client used by the currently active process.
	
	This is here as convenience and it will make sense 
	to send it inside a transactional environment like this:

	aPool commit:[aPool currentClient doLowLevelStuff]"
	
	^ ARCurrentClient value