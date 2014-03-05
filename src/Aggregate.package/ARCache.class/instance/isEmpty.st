testing
isEmpty 

	^ self protection critical: [
		self support isEmpty ]