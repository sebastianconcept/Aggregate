actions
addDummyUsers: anInteger times: anotherInteger do: aBlock

	users := Set new.

	self addDummyUsers: anInteger times: anotherInteger to: pool and: users do: aBlock 
	
