actions
read
	"Make components of the introspectee which are 
	proxies to become real persistents.
	Do this deeply (sub components)."

	^ self readVisits: IdentitySet new