queries
last: anInteger of: aSelector
	"Answers the last anInteger aggregates indexed by aSelector"
	
	^ (self storage indexFor: self selector: aSelector) last: anInteger