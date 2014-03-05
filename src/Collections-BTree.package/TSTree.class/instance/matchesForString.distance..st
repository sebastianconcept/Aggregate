matching
matchesForString: aString distance: aNumber
	^ Array streamContents:
		[:s |
		self matchesForString: aString distance: aNumber do:
			[:match |
			s nextPut: match]]