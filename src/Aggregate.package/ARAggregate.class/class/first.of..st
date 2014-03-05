queries
first: anInteger of: aSelector
	"Answers the first anInteger aggregates indexed by aSelector"
	
	^ (self storage indexFor: self selector: aSelector) first: anInteger