enumerating
from: start do: aBlock
	self from: start to: nil keysAndValuesDo: [:k :v | aBlock value: v]