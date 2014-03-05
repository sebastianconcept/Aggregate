actions
readVisits: visitedParts
	"Make components of the introspectee which are 
	proxies to become real persistents.
	Do this deeply (sub components)."

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