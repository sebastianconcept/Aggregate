*aggregate
fresh
	"Answer the receiver for any object but aggregates.
	All objects are considered as fresh as they can be.
	Only aggregates can be re-read fresh from the repository.
	Meant to be polimorphic for aggreggates"
	^ self 