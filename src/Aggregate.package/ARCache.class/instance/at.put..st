actions
at: aTransaction put: aQueryResults

	^ self protection critical:[
		self support at: aTransaction put: aQueryResults]