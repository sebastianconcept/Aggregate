queries
find: aValue of: aSelector
	"Answers the aggregate (or aggregates) found for aValue indexed by aSelector"
	
	^ self storage find: self  where: aSelector is: aValue