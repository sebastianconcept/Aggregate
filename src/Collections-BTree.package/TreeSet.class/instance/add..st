public
add: anObject
	| key bucket |
	key := self keyForValue: anObject.
	bucket := tree at: key ifAbsent: [#()].
	(self bucket: bucket includes: anObject) ifFalse:
		[tree at: key put: (bucket copyWith: anObject)].