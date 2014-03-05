*aggregate
isMany
	"Answers true if the receiver holds many objects.
	E.g., it implements #do:"
	^ self respondsTo: #do: