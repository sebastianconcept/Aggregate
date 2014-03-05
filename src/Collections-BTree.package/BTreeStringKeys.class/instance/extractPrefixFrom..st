as yet unclassified
extractPrefixFrom: readStreams
	| prefixStream nextChars |
	prefixStream := String new writeStream.
	
	[readStreams anySatisfy: [:ea | ea atEnd]] whileFalse:
		[nextChars := readStreams collect: [:ea | ea next].
		(nextChars allSatisfy: [:ea | ea = nextChars first])
				ifTrue: [prefixStream nextPut: nextChars first]
				ifFalse: [readStreams do: [:ea | ea skip: -1]. ^ prefixStream contents]].
	^ prefixStream contents
