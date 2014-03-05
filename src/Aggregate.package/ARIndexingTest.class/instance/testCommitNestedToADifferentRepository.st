testing
testCommitNestedToADifferentRepository
	"Test if ActiveRecords is able to make a commit inside
	of a commit made to a different repository"
	| moreUsers anotherPool guy1Id guy2Id girlId |

	self resetStorage.
	"put 10 active records in the test storage"
	self addDummyUsers: 10 times: 1.
	
	moreUsers := Set new.
	"put 10 active records more in a secondary test storage"
	anotherPool := ARODBPool onPath: self secondaryRepositoryPath.
	anotherPool exists ifFalse:[
		anotherPool ensureExistence].
	self resetStorageOf: anotherPool.
	self addDummyUsers: 10 times: 1 to: anotherPool and: moreUsers.

	pool commit:[|guys|
		guys := users copy.
		guy1Id := (guys remove: users anyOne) id.
		(ARDummyUser atId: guy1Id) username: 'frodo'; save.
		anotherPool commit:[|girls|
			girls := moreUsers copy.
			girlId := (girls remove: moreUsers anyOne) id.
			(ARDummyUser atId: girlId) username: 'galadriel'; save].
		guy2Id := (guys remove: guys anyOne) id.
		(ARDummyUser atId: guy2Id) username: 'golum'; save].
	
	anotherPool readOnly:[
		self assert: (ARDummyUser atId: girlId) username = 'galadriel'].

	pool readOnly:[
		anotherPool readOnly:[
			self assert: (ARDummyUser atId: girlId) username = 'galadriel'].
		self assert: (ARDummyUser atId: guy1Id) username = 'frodo'.
		self assert: (ARDummyUser atId: guy2Id) username = 'golum'].
	
