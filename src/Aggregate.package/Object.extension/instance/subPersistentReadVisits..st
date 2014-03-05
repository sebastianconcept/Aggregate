*aggregate
subPersistentReadVisits: visitedParts
	"Return the receiver with real persistent instead of proxies."

	^ self persistentReader readVisits: visitedParts