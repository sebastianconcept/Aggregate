accessing
currentTransaction
	"Answers the transaction of the currently active process.
	
	This is here as convenience and it will make sense 
	to send it inside a transactional environment like this:

	aPool commit:[aPool currentTransaction doLowLevelStuff]"
	
	^ OmniBase currentTransaction 