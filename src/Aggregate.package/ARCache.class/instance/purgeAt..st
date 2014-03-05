actions
purgeAt: aTransaction 
	"Purifies the support of this cache in the slot 
	that corresponds to aTransaction"
	
	self protection critical:[|queryResults|
		queryResults := self support at: aTransaction ifAbsent:[nil].
		queryResults isNil 
			ifTrue: [
				"Gentle fallback with a discrete warning"
				Transcript cr; show: 'warn: transaction not found when purging']
			ifFalse:[
				queryResults purge.
				self support removeKey: aTransaction]]