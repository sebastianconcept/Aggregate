accessing
root
	"Answers the root of the repository.
	This is here as convenience and it will make sense 
	to send it inside a transactional environment like this:

	aPool commit:[(aPool root at: #stuff) singAndDance]"
	
	^ OmniBase root