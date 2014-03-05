actions
removeKey: aTransaction 

	^ self protection critical:[
		self support removeKey: aTransaction ifAbsent:[
			"Gentle fallback with a discrete warning"
			Transcript cr; show: 'warn: trying to remove from the cache a transaction that wasn''t there']]