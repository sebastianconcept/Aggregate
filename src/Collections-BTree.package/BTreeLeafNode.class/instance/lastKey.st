as yet unclassified
lastKey
	| last |
	last := nil.
	self keysDo: [:k | last := k].
	^ last