as yet unclassified
abbreviationsAndIndicesDo: aBlock
	| stream |
	stream := abbreviations readStream.
	1 to: self size do:
		[:i |
		stream atEnd
			ifFalse: [aBlock value: prefix, (stream next: self abbreviationSize) value: i]
			ifTrue: [aBlock value: nil value: i]]