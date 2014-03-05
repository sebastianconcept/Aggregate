actions
use: anObject during: aBlock
	"Make this dynamic variable to have anObject 
	as its value during the evaluation of aBlock."
	
	^ aBlock on: self do: [ :notification | 
		notification resume: anObject ]