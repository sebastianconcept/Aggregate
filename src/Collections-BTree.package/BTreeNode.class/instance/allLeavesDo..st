enumerating
allLeavesDo: aBlock
	self withAllChildrenDo: [:ea | ea isLeaf ifTrue: [aBlock value: ea]]