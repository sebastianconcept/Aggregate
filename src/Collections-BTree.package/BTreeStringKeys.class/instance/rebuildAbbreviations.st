as yet unclassified
rebuildAbbreviations
	| keyStreams filled |
	filled := keys count: [:ea | ea notNil].
	abbreviations := String new: (filled * self abbreviationSize).
	filled = 0 ifTrue: [prefix := ''. ^ self ].
	keyStreams := (1 to: filled) collect: [:i | (keys at: i) readStream].
	
	prefix := self extractPrefixFrom: keyStreams.
	abbreviations := self buildAbbreviationsFrom: keyStreams.
