accessing
values
	^ Array streamContents: [:s | self do: [:ea | s nextPut: ea]]