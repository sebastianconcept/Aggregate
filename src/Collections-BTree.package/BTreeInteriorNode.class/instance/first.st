as yet unclassified
first
	self childrenDo: [ :node | ^ node first ].
	self error: 'this tree is empty'