matching
matchesForPrefix: aString
	^ Array streamContents:
		[:s |
		self matchesForPrefix: aString do:
			[:match |
			s nextPut: match]]