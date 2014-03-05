enumerating
within: aDuration of: aDateAndTime
	"Returns all events within the given duration from the given date, in either direction."
	
	^ self between: (aDateAndTime - aDuration) and: (aDateAndTime + aDuration)