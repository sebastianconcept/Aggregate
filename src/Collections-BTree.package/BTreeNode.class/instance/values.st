accessing
values
	^ Array streamContents: [:s | self valuesDo: [:ea | s nextPut: ea]]