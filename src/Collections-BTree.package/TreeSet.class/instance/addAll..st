public
addAll: aCollection
	| oldVals newVals combined |
	(self isCompatibleTreeSetWith: aCollection) ifFalse: [^ super addAll: aCollection].

	aCollection tree keysAndValuesDo:
		[:key :vals |
		oldVals := tree at: key ifAbsent: [#()].
		newVals := oldVals isEmpty
					ifTrue: [vals]
					ifFalse: [vals reject: [:ea | self bucket: oldVals includes: ea]].
		newVals isEmpty ifFalse:
			[combined := oldVals isEmpty ifTrue: [newVals] ifFalse: [oldVals, newVals].
			tree at: key put: combined]]