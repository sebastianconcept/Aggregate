as yet unclassified
keys
	^ Array streamContents: [:s | self keysDo: [:ea | s nextPut: ea]]