queries
from: start to: end of: aSelector
	"Answers the aggregates indexed by aSelector
	that are from the occurrence number start 
	up to the occurrence number end"
	
	^ self storage find: self from: start to: end of: aSelector
	
	
