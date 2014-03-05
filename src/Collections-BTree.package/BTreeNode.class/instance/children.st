accessing
children
	^ Array streamContents: [:s | self childrenDo: [:ea | s nextPut: ea]]