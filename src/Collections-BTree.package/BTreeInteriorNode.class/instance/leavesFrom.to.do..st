as yet unclassified
leavesFrom: start to: end do: aBlock
	| startIndex endIndex |
	startIndex := start ifNil: [1] ifNotNil: [(keys findIndexForKey: start) max: 1].
	endIndex := end ifNil: [keys lastIndex] ifNotNil: [keys findIndexForKey: end].
	startIndex to: endIndex do: [:i | (self at: i) leavesFrom: start to: end do: aBlock]