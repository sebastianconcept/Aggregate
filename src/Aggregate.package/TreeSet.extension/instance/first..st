*aggregate
first: anInteger
	"Answer a copy of the receiver comprising the leftmost anInteger elements."

	^self copyFrom: 1 to: anInteger