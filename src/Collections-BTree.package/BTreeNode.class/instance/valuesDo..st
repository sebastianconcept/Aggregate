enumerating
valuesDo: aBlock
	self keysAndValuesDo: [:k :v | aBlock value: v]