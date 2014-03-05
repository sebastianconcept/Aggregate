enumerating
upTo: end do: aBlock
	self from: nil to: end keysAndValuesDo: [:k :v | aBlock value: v]