initialization
initializeProtection
	"Initializes the protection of the access to the cache.
	Note: cache is mostly to read so we can safely protect it 
	with a monitor so it allows reentrance."
	^ protection := Monitor new