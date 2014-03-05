private
keysAndValuesDo: aBlock prefix: aString
	| fullKey |
	fullKey := aString copyWith: key.
	value ifNotNil: [aBlock value: fullKey value: value].
	low ifNotNil: [low keysAndValuesDo: aBlock prefix: aString].
	equal ifNotNil: [equal keysAndValuesDo: aBlock prefix: fullKey].
	high ifNotNil: [high keysAndValuesDo: aBlock prefix: aString]