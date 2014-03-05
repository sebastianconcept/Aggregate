testing
testToMany

	| changedTag removedTag |

	self resetStorage.
	self addDummyUsers: 1 times: 1.
	self addDummyTags: 10 times: 1.

	"Check insert"
	pool commit:[
		ARDummyUser first tags: tags; save].
	
	pool readOnly:[|guy|
		self assert: ARDummyUser first tags notEmpty.
		guy := ((pool root at: #storage) find: ARDummyUser where: #tags includes: tags anyOne) first.
		self assert: guy id = ARDummyUser first id.
		self assert: ARDummyUser first id = (ARDummyUser withTag: tags anyOne) first id].
	
	"Check update"
	pool commit:[|guy|
		guy := ARDummyUser first.
		removedTag := guy tags rehash remove: guy tags anyOne.		
		self deny: (guy tags includes: removedTag).
		guy save].
	
	pool readOnly:[|guy|
		self assert: ARDummyUser first tags notEmpty.
		self assert: ARDummyUser first tags size = 9.
		self assert: ((pool root at: #storage) find: ARDummyUser where: #tags includes: removedTag) isEmpty.
		self assert: (ARDummyUser withTag: removedTag) isEmpty.
		].
	
	"Check remove"
	
