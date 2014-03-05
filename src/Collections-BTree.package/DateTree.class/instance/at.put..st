adding
at: aTimespan put: anObject
	| timespans |
	timespans := startTimes at: aTimespan start ifAbsentPut: [ Set new ].
	timespans add: aTimespan.
	timespans := endTimes at: aTimespan end ifAbsentPut: [ Set new ].
	timespans add: aTimespan.
	events at: aTimespan put: anObject.
	^ anObject