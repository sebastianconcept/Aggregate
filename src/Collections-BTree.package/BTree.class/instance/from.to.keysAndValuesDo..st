enumerating
from: start to: end keysAndValuesDo: aBlock
	root leavesFrom: start to: end do:
		[:ea |
		ea keysAndValuesDo:
			[:k :v |
			((start isNil or: [k >= start]) and:
				[end isNil or: [k <= end]]) ifTrue:
					[aBlock value: k value: v]]]