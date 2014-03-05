testing
existsId: anId
	"Answers true if there is an object stored at anId.
	Note: it allows you to search in an abstraction of the aggregate."

	^ (self atId: anId) notNil