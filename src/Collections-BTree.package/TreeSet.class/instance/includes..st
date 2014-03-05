public
includes: anObject
	| bucket |
	bucket :=  tree at: (self keyForValue: anObject) ifAbsent: [^ false].
	^ self bucket: bucket includes: anObject