accessing
values
	^ Array streamContents:
		[:s |
		self valuesDo: [:k | s nextPut: k]]