initialization
initializeSupport
	"Initializes the support of this cache.
	Note: currently it'll use an identity dictionary 
	which is not thread safe and needs the protection."
	^ support := IdentityDictionary new