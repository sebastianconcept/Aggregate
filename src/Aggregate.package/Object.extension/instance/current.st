*aggregate
current
	"Answer the receiver for any object but aggregates.
	All objects are considered as the current (inthe assumed current transation).
	Only aggregates can be re-read from in the current transaction.
	Meant to be polimorphic for aggreggates"
	^ self 