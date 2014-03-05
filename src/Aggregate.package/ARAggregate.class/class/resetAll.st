actions
resetAll
	"Reset the caches of all the subhierarchy"
	self withAllSubclasses do:[:anAggregateClass|
		anAggregateClass reset]