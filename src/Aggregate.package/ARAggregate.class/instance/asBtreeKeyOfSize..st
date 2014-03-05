accessing
asBtreeKeyOfSize: keySize
	keySize < self class idKeySize ifTrue: [self error: 'Key size is too small'].

	^ id asBtreeKeyOfSize: keySize 