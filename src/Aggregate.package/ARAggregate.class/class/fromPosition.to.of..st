queries
fromPosition: start to: end of: aSelector
	"Answers the aggregates indexed by aSelector
	that are from the occurrence number start up to the occurrence number end"
	
	^ (self storage indexFor: self selector: aSelector) fromPosition: start to: end