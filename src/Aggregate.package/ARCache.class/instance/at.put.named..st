actions
at: aTransaction put: someActiveRecords named: aString

	aTransaction when: #finishedTransaction: sendOnce: #onTransactionFinished: to: self.

	self at: aTransaction put: (ARQueryResults for: someActiveRecords named: aString).
	
	^ someActiveRecords 