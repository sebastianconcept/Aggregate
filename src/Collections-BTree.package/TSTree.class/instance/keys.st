accessing
keys
	^ Array streamContents: [:s | self keysAndValuesDo: [:k :v | s nextPut: k]]