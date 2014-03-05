as yet unclassified
findIndexForKey: aString
	| stream str diff |
	prefix = self nilPrefix ifTrue: [self rebuildAbbreviations].
	stream := aString readStream.
	str := stream next: prefix size + self abbreviationSize.
	diff := prefix size + self abbreviationSize - str size.
	str := str, (String new: diff).
	self abbreviationsAndIndicesDo:
		[:abbr :i |
		abbr ifNil: [^ i - 1].
		str < abbr ifTrue: [^ i - 1].
		str = abbr ifTrue: [^ super findIndexForKey: aString]].
	^ self size