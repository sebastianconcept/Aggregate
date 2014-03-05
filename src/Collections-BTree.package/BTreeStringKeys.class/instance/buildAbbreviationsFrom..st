as yet unclassified
buildAbbreviationsFrom: readStreams
	| nextChars |
	1 to: self abbreviationSize do:
		[:i |
		nextChars := readStreams collect: [:ea | ea next ifNil: [Character value: 0]].
		nextChars withIndexDo:
			[:c :j |
			abbreviations at: (j-1 * self abbreviationSize) + i put: c]].
	^ abbreviations