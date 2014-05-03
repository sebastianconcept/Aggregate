actions
jsonObjectVisits: visitedParts
	"Return aJsonObject with the load found in the introspectee.
	Do this deeply, converting sub aggregates in references."

	introspectee class isMeta ifTrue:[^introspectee realPersistent].
	introspectee deservesPersistentRead ifFalse:[^introspectee realPersistent].
	(visitedParts includes: introspectee) ifTrue:[^introspectee realPersistent].
	visitedParts add: introspectee.
	
	introspectee class allInstVarNames do:[:name| |var| 
		var := introspectee instVarNamed: name.
		var deservesPersistentRead ifTrue:[
			var subPersistentReadVisits: visitedParts].
		var isODBReference ifTrue:[
			introspectee instVarNamed: name put: var realPersistent]].

	^ introspectee realPersistent