actions
readVisits: visitedParts
	"Make components of the introspectee which are 
	proxies to become real persistents.
	Do this deeply (sub components)."
	
	introspectee class isMeta ifTrue:[^introspectee realPersistent].
	introspectee deservesPersistentRead ifFalse:[^introspectee realPersistent].
	(visitedParts includes: introspectee) ifTrue:[^introspectee realPersistent].
	visitedParts add: introspectee.
	
	introspectee do:[:anElement|
		anElement deservesPersistentRead ifTrue: [
			anElement subPersistentReadVisits: visitedParts].
		anElement isODBReference ifTrue:[
			introspectee 
				replaceAll: anElement 
				with: anElement realPersistent]].

	^ introspectee realPersistent