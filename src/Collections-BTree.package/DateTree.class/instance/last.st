accessing
last
	| timespans |
	timespans := endTimes last 
		asSortedCollection: [ :a :b | a end <= b end ].
	^ events 
		at: timespans last
		ifAbsent: [ self errorEmptyCollection ]