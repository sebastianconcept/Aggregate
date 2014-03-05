as yet unclassified
last
	| child |
	child := nil.
	self childrenDo: [ :node | child := node ].
	child isNil ifTrue: [ self error: 'this tree is empty' ].
	^ child last