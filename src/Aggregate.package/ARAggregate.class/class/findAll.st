queries
findAll
	"Answers all instances of this kind (and sub kinds) of aggregate or an empty set.
	Note 1: this is only a good idea when you have stored few (less than 100?)
	and starts to become a REALLY BAD idea when you have, for instance, more than 100 thounsand.
	Note 2: if this aggregate has subclasses their instances are going to be included."

	| cached answer |

	"First try to do a cache hit, if is not a hit then 
	lazily store the results of a gentle fallback to the real query"
	"cached := self cache at: self currentTransaction named: 'findAll'."	

	^ self basicFindAll

	"Answers a copy (using asOrderedCollection) 
	so the application can do its stuff without 
	comprimising the integrity of the cache"
"	^ cached isNil
		ifFalse:[cached asOrderedCollection]
		ifTrue:[
			answer := self basicFindAll.
			self cache 
					at: self currentTransaction
					put: answer
					named: 'findAll'.
			answer asOrderedCollection]."

