accessing
keys
	^ Array streamContents:
		[:s |
		self keysDo: [:k | s nextPut: k]]