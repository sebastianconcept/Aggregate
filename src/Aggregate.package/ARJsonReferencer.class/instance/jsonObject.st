actions
jsonObject
	"Return aJsonObject with the load found in the introspectee.
	Do this deeply, converting sub aggregates in references."

	^ self jsonObjectVisits: IdentitySet new