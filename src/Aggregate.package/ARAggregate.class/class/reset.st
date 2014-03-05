actions
reset
	"Resets the cache of this active recod (alone)"
	
	cache isNil ifFalse: [|exCache|
		exCache := cache.
		cache := nil.
		exCache purge]
	