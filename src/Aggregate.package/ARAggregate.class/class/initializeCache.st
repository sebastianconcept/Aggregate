initialization
initializeCache
	"Answers the cache that relates query results to transactions.
	Remember: this are very transident, very short term kind of cache.
	It's only valid until the transaction finished (one way or another)"
	^ cache := ARCache new