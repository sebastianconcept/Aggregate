accessing
aggregate
	"Answers the receiver.
	Applicability: useful to make proxies fail into the real persistent"

	"This is to save us from redundant deep introspections (to de-proxy this aggregate)"
	^ (isProxied isNil or:[
	isProxied])
		ifFalse:[self]  
		ifTrue:[|real|
			real := self persistentRead.
			isProxied := false.
			real]