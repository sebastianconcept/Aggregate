*aggregate
last: anInteger
	"Answer a copy of the receiver comprising the rightmost anInteger elements."

	| size |
	size := self size.
	^self copyFrom: (size + 1 - anInteger) to: size