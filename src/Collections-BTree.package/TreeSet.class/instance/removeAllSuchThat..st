public
removeAllSuchThat: aBlock
	| changes remove |
	changes := Dictionary new.
	tree keysAndValuesDo:
		[:key :bucket |
		remove := bucket select: aBlock.
		remove isEmpty ifFalse:
			[changes at: key put: (bucket copyWithoutAll: remove)]].
	changes keysAndValuesDo:
		[:key :bucket |
		tree at: key put: bucket]