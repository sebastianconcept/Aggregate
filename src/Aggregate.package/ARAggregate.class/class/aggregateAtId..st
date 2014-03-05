queries
aggregateAtId: anId
	"Answers the aggregate found at anId or nil.
	Note: 
	1. it allows you to search in an abstraction of the aggregate.
	2. is not proxied (trans-transactional)"

	^ (self atId: anId) aggregate 