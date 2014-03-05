private
printOn: aStream

	super printOn: aStream.

	aStream nextPutAll: ' (',self aggregateClassName,'-',selector asString,')'