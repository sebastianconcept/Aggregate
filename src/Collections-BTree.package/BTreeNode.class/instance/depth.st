accessing
depth
	^ parent ifNil: [1] ifNotNil: [1 + parent depth]