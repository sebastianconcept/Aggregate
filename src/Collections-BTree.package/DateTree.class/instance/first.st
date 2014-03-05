accessing
first
	| timespans |
	timespans := startTimes first 
		asSortedCollection: [ :a :b | a start <= b start ].
	^ events 
		at: timespans first
		ifAbsent: [ self errorEmptyCollection ]