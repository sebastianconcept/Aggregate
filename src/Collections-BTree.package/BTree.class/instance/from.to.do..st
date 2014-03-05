enumerating
from: start to: end do: aBlock
	self from: start to: end keysAndValuesDo: [:k :v | aBlock value: v]