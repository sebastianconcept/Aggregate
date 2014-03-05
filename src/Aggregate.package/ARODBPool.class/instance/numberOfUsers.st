accessing
numberOfUsers
	"Answers how many users are connected to the odb."
	
	^ self withClientDo:[:anOmniBase|
		anOmniBase numberOfClients]