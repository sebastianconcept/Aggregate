public
remove: anObject
	| key bucket |
	key := self keyForValue: anObject.
	bucket := tree at: key ifAbsent: [^ self].
	(self bucket: bucket includes: anObject) ifTrue:
		[bucket := bucket reject: [:ea | self value: anObject matches: ea].
		bucket isEmpty
			ifTrue: [tree removeKey: key]
			ifFalse: [tree at: key put: bucket]]