private
nodesDo: aBlock
	aBlock value: self.
	low ifNotNil: [low nodesDo: aBlock].
	equal ifNotNil: [equal nodesDo: aBlock].
	high ifNotNil: [high nodesDo: aBlock]